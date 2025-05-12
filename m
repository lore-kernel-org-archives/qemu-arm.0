Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2628985njb;
        Mon, 12 May 2025 03:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl/t4u7CBSJQenbl9KbCVpl0IgyZGeQdCNFajnf1Rn+/qt4beMFjZjyIAltyd5edbWZDcM9b3zN1Fgaw==@linaro.org
X-Google-Smtp-Source: AGHT+IHF2NLRXkilSAinfANcu7GqenLKW5k+OXsmC2mX+onueBpuZ5uuxvt0r4o84qwP5uF75/Ot
X-Received: by 2002:a05:622a:1a91:b0:494:48b1:a047 with SMTP id d75a77b69052e-494527d49f2mr158116171cf.40.1747047296553;
        Mon, 12 May 2025 03:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747047296; cv=none;
        d=google.com; s=arc-20240605;
        b=OLSBHCHhlYlhnGFRdzMIe1N0C91GwTHT98xetCvLDE/PslbRfIuivqzPffmLg0zmfX
         JaJd148lISdU2rxD3M1xVxEUFFeNJsQLjf0I+nRp9HtXwNDMI7wxkXby7fPEdveF0aps
         Bq1d67lj0hY2NuEgm7/OH48BHAI8SAZix0zYddpfv76lCv5xfxgzy/tvF2y4TPId3n3v
         N1AdAGm9EPi+NjFDB6XCwMkuWVcduteLHJrdyfNnGMXlFyDfPLgJZb2E2qnLyOEwz0da
         ejf6s4oBSwhi97THwUjEDyU0D20QljiOMDodhOBxuGzOmGlfXIq31OCGDX2fyXKvTYae
         z3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=SrhwlyGHBUeZB9shLrDj8sqTvUNxSWhy6HB7k6LP93M=;
        fh=PxZEHnNX7JCdy8fKlBGnbcIDYx5gJG4AFkRCf34J1Gk=;
        b=jn31WHBsxVvbjjO37wWKlidYOeob37VbuxVT+Bz9GkbeLNYRrpT7x8HCSOdgyJf+vn
         YfVqXHZeWN6/FOTwIpCmzyGeYuH9WaIg18YrWcGN6JmfNe8NqwRX9SY7VdjOWs7xs3j9
         HiZ+dJOVjF84WldYrP/iy/1boCpmWss9DBu84MePydIkRuEa8rHMsCd+nJrFP1SvPen9
         lWINpBQWHv5ieOzaAw52w1bAYThIo6JFDtWcdWm6nk48UXkIELa33QdxevMadCvDl2br
         EVVE9hM4lqMwcx1vTA3TMgb+/btUwnZNeFXDls3ArqX7sjPhje1jCRGKy6QKYDqRs8T7
         PdLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCChHwCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259f17dsi86014291cf.595.2025.05.12.03.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 03:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iCChHwCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEQo0-0002iJ-QM; Mon, 12 May 2025 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uEQnz-0002h7-Eu
 for qemu-arm@nongnu.org; Mon, 12 May 2025 06:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uEQnx-0008Fk-Ci
 for qemu-arm@nongnu.org; Mon, 12 May 2025 06:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747047279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrhwlyGHBUeZB9shLrDj8sqTvUNxSWhy6HB7k6LP93M=;
 b=iCChHwCgNuvlCMaK+o4+zvzUysqvfT54c6npibsqHDje1BOTBNRkg+FmXC1dmvfL++R79J
 C/dkjhOUFHRoy2bEOQoz9cLY/21dq9foVfogHa9BDc54BqiUJvJdfUcKIWI/oZk64WPHg8
 qmpKHgzHxMOsqL2dD2mMQN/HBbdeLUM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-44B2jiPpPf6gVRkeWUfX9g-1; Mon,
 12 May 2025 06:54:36 -0400
X-MC-Unique: 44B2jiPpPf6gVRkeWUfX9g-1
X-Mimecast-MFC-AGG-ID: 44B2jiPpPf6gVRkeWUfX9g_1747047273
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4108E180045B; Mon, 12 May 2025 10:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.27])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1F165180049D; Mon, 12 May 2025 10:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 506DC21E66E3; Mon, 12 May 2025 12:54:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,  Xiaoyao Li
 <xiaoyao.li@intel.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-devel@nongnu.org,  Richard
 Henderson <richard.henderson@linaro.org>,  kvm@vger.kernel.org,  Gerd
 Hoffmann <kraxel@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,  Yi Liu <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-riscv@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,  Amit Shah
 <amit@kernel.org>,  Yanan Wang <wangyanan55@huawei.com>,  Helge Deller
 <deller@gmx.de>,  Palmer Dabbelt <palmer@dabbelt.com>,  Ani Sinha
 <anisinha@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Fabiano
 Rosas <farosas@suse.de>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?utf-8?Q?Cl=C3=A9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,  Jason Wang <jasowang@redhat.com>
Subject: Re: How to mark internal properties
In-Reply-To: <aCG6MuDLrQpoTqpg@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 12 May 2025 10:06:58 +0100")
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
 <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
 <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
 <aCG6MuDLrQpoTqpg@redhat.com>
Date: Mon, 12 May 2025 12:54:26 +0200
Message-ID: <87jz6mqeu5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.587,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IF98spWIIwMX

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, May 12, 2025 at 09:46:30AM +0100, Peter Maydell wrote:
>> On Fri, 9 May 2025 at 11:04, Thomas Huth <thuth@redhat.com> wrote:
>> > Thanks for your clarifications, Zhao! But I think this shows again the
>> > problem that we have hit a couple of times in the past already: Proper=
ties
>> > are currently used for both, config knobs for the users and internal
>> > switches for configuration of the machine. We lack a proper way to say=
 "this
>> > property is usable for the user" and "this property is meant for inter=
nal
>> > configuration only".
>> >
>> > I wonder whether we could maybe come up with a naming scheme to better
>> > distinguish the two sets, e.g. by using a prefix similar to the "x-" p=
refix
>> > for experimental properties? We could e.g. say that all properties sta=
rting
>> > with a "q-" are meant for QEMU-internal configuration only or something
>> > similar (and maybe even hide those from the default help output when r=
unning
>> > "-device xyz,help" ?)? Anybody any opinions or better ideas on this?
>>=20
>> I think a q-prefix is potentially a bit clunky unless we also have
>> infrastructure to say eg DEFINE_INTERNAL_PROP_BOOL("foo", ...)
>> and have it auto-add the prefix, and to have the C APIs for
>> setting properties search for both "foo" and "q-foo" so you
>> don't have to write qdev_prop_set_bit(dev, "q-foo", ...).

If we make intent explicit with DEFINE_INTERNAL_PROP_FOO(), is repeating
intent in the name useful?

> I think it is also not obvious enough that a 'q-' prefix means private.

Concur.

> Perhaps borrow from the C world and declare that a leading underscore
> indicates a private property. People are more likely to understand and
> remember that, than 'q-'.

This is fine for device properties now.  It's not fine for properties of
user-creatable objects, because these are defined in QAPI, and QAPI
prohibits names starting with a single underscore.  I append relevant
parts of docs/devel/qapi-code-gen.rst for your convenience.

Why does QAPI prohibit leading underscores?  Chiefly because such names
are reserved identifiers in C.  Instead of complicating the mapping from
QAPI name to C identifier, we restrict QAPI names and call it a day.

The mapping between device property name and C identifiers is entirely
manual.  When a property is backed by a member of the device state
struct, naming the member exactly like the property makes sense.  Having
to mentally strip / insert a leading underscore would hardly be
terrible, just a bit of friction.  I'd prefer not to.




Naming rules and reserved names
-------------------------------

All names must begin with a letter, and contain only ASCII letters,
digits, hyphen, and underscore.  There are two exceptions: enum values
may start with a digit, and names that are downstream extensions (see
section `Downstream extensions`_) start with underscore.

Names beginning with ``q_`` are reserved for the generator, which uses
them for munging QMP names that resemble C keywords or other
problematic strings.  For example, a member named ``default`` in qapi
becomes ``q_default`` in the generated C code.

[...]

Downstream extensions
---------------------

QAPI schema names that are externally visible, say in the Client JSON
Protocol, need to be managed with care.  Names starting with a
downstream prefix of the form __RFQDN_ are reserved for the downstream
who controls the valid, reverse fully qualified domain name RFQDN.
RFQDN may only contain ASCII letters, digits, hyphen and period.

Example: Red Hat, Inc. controls redhat.com, and may therefore add a
downstream command ``__com.redhat_drive-mirror``.

