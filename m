Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp204831njf;
        Fri, 30 Aug 2024 03:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgnh6CmdXqtnUxeq/XejFVfaKC7E1Y52TR6X8mOKorFHOMKGQR4mu2iScblo6s7wx9PhWi7c6Vf9iPXg==@linaro.org
X-Google-Smtp-Source: AGHT+IGU6XmFBkdi1js4d5Vjx7l5OLfzQbhkhBBZWZFqbR2z+i5V/XkPx22NEek4gB3BN89MTKA+
X-Received: by 2002:a05:6214:5544:b0:6b4:fea8:6bfc with SMTP id 6a1803df08f44-6c33e5e6b46mr67727096d6.10.1725015136814;
        Fri, 30 Aug 2024 03:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725015136; cv=none;
        d=google.com; s=arc-20160816;
        b=TJk6kmVkKNXb5SukU6I2LUtp0SUbWaCNXZCb5ztHUOAdqEUDNKd4tS4bWD1EWVb8+1
         GxnknWdgMYRQt4d6jTs5kANJbNseQQfxgRgBUuZUKSZCDwSMjdb/cVr24j7Z0n0Z3/PV
         9hTtgmJDDjA9aw9CE8xMK+GqMjf8wwr0zEwG6OfLNya/IGh1P6HKrjOOYj8RV2YqZWFS
         AZA6ULr8luHtR1k3Ww34ZzgaQQKCrfBXsK5fsyREnDfa1HY0woXKfCfIr5hi00wd8JeD
         776VJ6UbF31FbVsLuDqfToG+CJvSNWWAm4QHvlMOPxkFnrBgOQLgpvFbX4kgusgHivbU
         Qekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to;
        bh=AxelLFBlARu44DczKKH9x61tsw2peCrL6vBQUg7rF5E=;
        fh=3RaMZS7iAIuChOfpdfk1M11hYJZR/tcV5ciwfGIkimw=;
        b=of9ofjveSlLitNr4z/ggErCiI3eLQ1ASdYxA3zj0CI3mgEjJ7puvue7jb05B+Kni9j
         +iEXp1EWQwDTBgGcsZfUXUs+EQsOiwvb+1kxlcGgHybwHvqpXI/AvZnqyXYMUI2g2rAS
         r5kLQ6YjMwoePeks7ZmTds+/OyIo7Ejy7Hfil64axz+qHiCNmStaab0AepD6JBKcBM+m
         NM5Pi/gkW5rTotxwPdwzHbpwwUAGsmS1BbhitSnr4VS0tlFT3QaKf+pkZHaLXMLWvwkk
         gJkWy36xdqe/J/CsrfP9LFpuv10TGjh+cYXxwFnrO8ztYyt8VrQRalJrqsevo5b9Vp+R
         KZeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340da5b0bsi36569566d6.420.2024.08.30.03.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 03:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjzEW-00054K-41; Fri, 30 Aug 2024 06:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjzET-00053S-J0; Fri, 30 Aug 2024 06:51:57 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1sjzEP-0003v9-R9; Fri, 30 Aug 2024 06:51:57 -0400
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WwFK52MvSzpStD;
 Fri, 30 Aug 2024 18:49:45 +0800 (CST)
Received: from kwepemd100012.china.huawei.com (unknown [7.221.188.214])
 by mail.maildlp.com (Postfix) with ESMTPS id 61500140360;
 Fri, 30 Aug 2024 18:51:30 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (7.221.188.204) by
 kwepemd100012.china.huawei.com (7.221.188.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 30 Aug 2024 18:51:30 +0800
Received: from kwepemd100011.china.huawei.com ([7.221.188.204]) by
 kwepemd100011.china.huawei.com ([7.221.188.204]) with mapi id 15.02.1258.034; 
 Fri, 30 Aug 2024 18:51:29 +0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: duchangbin <changbin.du@huawei.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm/boot: Report error msg if loading elf/dtb failed
Thread-Topic: [PATCH] hw/arm/boot: Report error msg if loading elf/dtb failed
Thread-Index: AQHa+q2oIp7h7OzKoEG863TRfi6oB7I/DPSAgACSrAA=
Date: Fri, 30 Aug 2024 10:51:29 +0000
Message-ID: <80da1b5b8a2043dea81d7883e10ccc55@huawei.com>
References: <20240830072409.2399084-1-changbin.du@huawei.com>
 <CAFEAcA995BnypV8Yx4fA_ojAt6NopyMnCWY8Gwb840++8kx91w@mail.gmail.com>
In-Reply-To: <CAFEAcA995BnypV8Yx4fA_ojAt6NopyMnCWY8Gwb840++8kx91w@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: kwepemd100011.china.huawei.com (15.02.1258.034)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.110.54.75]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0AD03D4E217F64686041A4DAF22BAA0@huawei.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=changbin.du@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-to:  duchangbin <changbin.du@huawei.com>
From:  duchangbin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U76eCBq/adbR

On Fri, Aug 30, 2024 at 11:05:59AM +0100, Peter Maydell wrote:
> On Fri, 30 Aug 2024 at 08:24, Changbin Du <changbin.du@huawei.com> wrote:
> >
> > Print errors before exit. Do not exit silently.
> >
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > ---
> >  hw/arm/boot.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index d480a7da02cf..17c01f299831 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *i=
nfo, uint64_t *pentry,
> >                        1, data_swab, as);
> >      if (ret <=3D 0) {
> >          /* The header loaded but the image didn't */
> > +        error_report("could not load elf '%s'", info->kernel_filename)=
;
> >          exit(1);
>=20
> I agree we should print a message here.
>=20
> >      }
> >
> > @@ -1322,6 +1323,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *m=
s, struct arm_boot_info *info)
> >       */
> >      if (!info->skip_dtb_autoload && have_dtb(info)) {
> >          if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, m=
s) < 0) {
> > +            error_report("could not load dtb '%s'", info->dtb_filename=
);
> >              exit(1);
>=20
> But for this case, arm_load_dtb() should be printing the error
> message itself (which lets it be more precise about what went
> wrong). Is there a code path where it fails to print an error?
>
Seems not. arm_load_dtb() prints errors on all of its failure paths. So thi=
s
change should be removed.

> thanks
> -- PMM

--=20
Cheers,
Changbin Du
