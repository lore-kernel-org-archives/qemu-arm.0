Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1638799ejc;
        Tue, 26 Sep 2023 23:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAOQjJOFC+Yx2i9wy1hNeQjC1qqLL5gQHE9CppHg5SURLrUaWOrBRdcIMAqHmbMsT1HqZm
X-Received: by 2002:a0c:b247:0:b0:65b:21f2:5573 with SMTP id k7-20020a0cb247000000b0065b21f25573mr1234376qve.58.1695797251851;
        Tue, 26 Sep 2023 23:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695797251; cv=none;
        d=google.com; s=arc-20160816;
        b=oXArLH7sdpB1bN4zcVLsw/1cOQTjELzSMCOiFBJxAslkbwrw2NkkuNTREVnxmAW1ZT
         9LnG2oAn6PSYKw+NjBAu2+GXH7EzVS6T7iFCkByzM9gOGolzgebPToaIxuEfwANRilEa
         znkbH/+sXs28en0aBsUjaaPZPuExMA9EphEEOm/DkOTB8Q9DEQ6CYFfhpddAqxg0Ki0a
         IU9A+KXDG7uJGeZR8Cr/+1foMXyshySok0iwh7qxZcPCQt/XjHCdbWB6+IpaXnM16KMj
         mnlwix/rppnxg4thosm6l7ixhhyPK5PPNZXgopGb/+ykxY8Kd/M3zYJgw6VdpLFNe/s4
         U7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=jHfWNUttDEkIkq0qYXjARtt+U1SQwB08GwRFOswqbn4=;
        fh=ja6vqiP1JKyg6RX/C8vp+KqhDkMvHEwEH2/O54EONqM=;
        b=srjtu5soJUgGz8249hUP+1rsBrcnmwQKVKfw2o0rBc2onFeAHPwhatE9/sSAC53Kbt
         wjMr9WBuvYMIhedR1iQyrwPNLWdxLctNI5Si5TN/Hq3FPjaW13oEKdKd4HDOUQgL0qoo
         uoM3vTqQwhZY4kN6x+9SkLoE434dE3rUrxTcNcL35aq0B/4rxft+Gm90J4tMHLxPxMGT
         IJq4dzUpe6EeDcuwkTMb3xHhbAjFP+Wc4+ryuoDSboP5CefZqr91jeTGeNDiA6VVq/1W
         GDnIQUPaMtuWABOQDCOxsJuekiw7kY/UgvwBgTY0XptOyq5LBjW+gknJpPg5dRv2SreL
         SvXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UqrwJWLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a0ce64c000000b00655e555f3f8si7787724qvn.566.2023.09.26.23.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 23:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UqrwJWLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlOK4-0000mQ-OO; Wed, 27 Sep 2023 02:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qlOK1-0000lJ-0i
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 02:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qlOJy-0006f0-Hc
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 02:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695797213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHfWNUttDEkIkq0qYXjARtt+U1SQwB08GwRFOswqbn4=;
 b=UqrwJWLmU6zDnpA+BmzzZzD4n5znvaDcEeiXGmM/+iiBFdQwo0KJ0ausYIbDWuf9+LebK+
 zDMM3l0VJ4tnJQqthdUHYHEiZYGDlhoAsVDzlzkTX77jtVdSp6QnTnhqEOvrex6PF57PFd
 8MzuIFwwKu2Nkro72RbrDH2VFc+9xNc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-DLYaCIXSOKWAn10nNANU9A-1; Wed, 27 Sep 2023 02:46:49 -0400
X-MC-Unique: DLYaCIXSOKWAn10nNANU9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 713233814588;
 Wed, 27 Sep 2023 06:46:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F381B2026D4B;
 Wed, 27 Sep 2023 06:46:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5B1821E6900; Wed, 27 Sep 2023 08:46:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>,  Peter Maydell
 <peter.maydell@linaro.org>,  Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
 <CACPK8XcCn4hK5Lu-6o7LUyUFVH-dkbjJ-1_fHr4_90_4cZf_+Q@mail.gmail.com>
 <bf0703cb-3626-a3e9-efda-842cd0393f37@kaod.org>
Date: Wed, 27 Sep 2023 08:46:47 +0200
In-Reply-To: <bf0703cb-3626-a3e9-efda-842cd0393f37@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Wed, 27 Sep 2023 07:44:16 +0200")
Message-ID: <87sf70f6zs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: rYpug8ZFrzy6

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 9/27/23 04:12, Joel Stanley wrote:
>> On Fri, 22 Sept 2023 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>=20
>>>> +    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>>>
>>> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where it=
 comes
>>> from ? Thanks,
>> That looks very strange. I think you've sorted it, so I wanted to
>> bring up the MAX macros themselves. It's unfortunate that they create
>> a non-unique local variable. Are we allowed to borrow the kernels
>> macros? They have some infrastructure for creating a unique local
>> variable name, as well as handling the const and non-const variants
>> with the one macro.
>> https://elixir.bootlin.com/linux/v6.5/source/include/linux/minmax.h
>
> I believe that's what Markus does in its own way :
>
>   https://lore.kernel.org/qemu-devel/20230921121312.1301864-8-armbru@redh=
at.com/

I wasn't aware of the kernel's infrastructure.  We can steal it if
people think it provides additional value.  Make your case :)

