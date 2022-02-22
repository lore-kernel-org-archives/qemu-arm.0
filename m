Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3622836lfq;
        Tue, 22 Feb 2022 08:01:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGdYYt3H/SkB9cJxHYY7TUgcxwkXRiLMSSQWslOqMgYadEbir9zZkcx/i0SsAqgpELrmc1
X-Received: by 2002:a05:6214:2aab:b0:432:4f62:ba56 with SMTP id js11-20020a0562142aab00b004324f62ba56mr1457398qvb.103.1645545660175;
        Tue, 22 Feb 2022 08:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645545660; cv=none;
        d=google.com; s=arc-20160816;
        b=Pj+guYIfEtNgbVm7ZoKWD9tT+GKXHBH1kHGFqGDceTUiXJ6US/x3qBlRKqhYlxxYYs
         Jk827zxSj9bIh5VfvNJW2n/PXdKUO+0OQQHljESnKkkAk1OaGT+mSztEa1kJT3ExmV12
         GHPksFn7R5xc91zLfL2uLO6ro2a4sKwQbLUZsTyI4xF3MO8j0VCyB+Ep7J/WbEDRDSk1
         1OzvYKGIEBgbfg15TbTGYj+n6zHvHsofnzhijH5/FvXUlsVHMeHUg33c7oiwaEG5SXxg
         s8IFSHnUfBhPIp8yIirvdUn++JQE6DR9Y3BLS/Xp4LcZfgK7/IRDMykgwsPziKFDccn1
         qemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=/SDfuA+pPUQIM+fN2f6KBI6TQOQHGoI1LD8IlgGppV8=;
        b=omjUDCItYH6JX8nYfj3EjesRHTpqoARJdJGjDaMhMT6PcmPo/jiGdiMPAbx1Fd5C5Z
         bl0esv2re6aXRST99xgw4z2RcxdZbXKnPJiPaY62/EU1VvUNd19sMRn3yiFJ4zdQSvuf
         RJeh9hgl8/C3G/AL7ZVYOY/sNDo3vICfR99JcZAAeXuw9pokXSsaH0iPrvkexhpzinKw
         nEhkG1a2A5mEx0N02HxPURrtrc/RNd4C6fyLg61QJtYnBUc7l9l7vCgnpXaVgSSUfBD9
         xkWgbDKPmnVIDIrH8JkXxzneMH5AK/vyjuuKyaP1wdY5UuLDxr8VU7NhoJJi6wMLyMJS
         Jm+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eE7LojbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si6471qvi.250.2022.02.22.08.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 08:01:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eE7LojbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMXb1-0006tB-BC
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 11:00:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMWiH-0006Xh-Id
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 10:04:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMWiF-0001II-K3
 for qemu-arm@nongnu.org; Tue, 22 Feb 2022 10:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645542262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/SDfuA+pPUQIM+fN2f6KBI6TQOQHGoI1LD8IlgGppV8=;
 b=eE7LojbA64MPzi1OC511uhlC5P2rGnItkiNGGXnfpnqgtwj1bRmlQFVTHW8HdK+J9Lz4l/
 M/OnOyCP0BG1iV/BK/0HSbTVFHJfvOkqSGUGBzBE38D5jKrS6MedgydBoy9gjfGPl5XzfV
 EE4poST3+zPTKC7a02NQAj7pzn/Ory0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-CNMsG4OuPT6atuVWPCDWgw-1; Tue, 22 Feb 2022 10:04:21 -0500
X-MC-Unique: CNMsG4OuPT6atuVWPCDWgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17AF71091DA0;
 Tue, 22 Feb 2022 15:04:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0D57A540;
 Tue, 22 Feb 2022 15:04:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0AE0121B9F8B; Tue, 22 Feb 2022 16:04:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
 <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
Date: Tue, 22 Feb 2022 16:04:03 +0100
In-Reply-To: <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 22 Feb 2022 13:56:01
 +0100")
Message-ID: <877d9nkknw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ls1pUjhcydff

Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> Hi Markus,
>
> On 22/2/22 13:02, Markus Armbruster wrote:
>> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
>> the RTC supports the event).  What if there's more than one RTC?
>
> w.r.t. RTC, a machine having multiple RTC devices is silly...
>
> Assuming one wants to emulate that; shouldn't all QMP events have a
> qom-path by default? Or have a generic "event-from-multiple-sources"
> flag which automatically add this field?

Not all events originate from a device, or even a QOM object.

The ones that do could all use a qom-path member, I guess.

[...]

