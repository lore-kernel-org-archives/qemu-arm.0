Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp145460ejr;
        Tue, 10 Oct 2023 06:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2gTS0ck5SooHpjwXyH3+1Tf367rCy6/pm47JXHuuh3H/lOiSJcjgqjaqqqXqIrmT7X9QI
X-Received: by 2002:a05:620a:2911:b0:774:2e8f:2170 with SMTP id m17-20020a05620a291100b007742e8f2170mr21418777qkp.4.1696945277492;
        Tue, 10 Oct 2023 06:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696945277; cv=none;
        d=google.com; s=arc-20160816;
        b=a5uKIg1YxYXPuQOLf7t6gS6ZM8T09jbWoS49yPgyF/0PeA4Xvz86SptbxDm9Nm1Ypo
         P6M6QFXFGzxletZi3w1I6z0GFh9LgaxnuKUB9HA14+mzL0XSWb2rY1dNT4+IyYdQR73f
         49RU+1w2Xqnv4DVC3mGlye7ORJg4T+601uoR8VfL5WqFrl33309PR0k6QjUDhxZTod3O
         S/CLXoUJHpn7ZZJzboLTDjZhJdMP3ko20Fgs5x8BmHU40ah3ue9ZqmxRESyHoDbdLb0O
         iP51JJ20dGgAc5UZTTweLCsmcJtwdliApdUZpkaOXN++s5WpxHGjhtVQncOzmJ9XjFS0
         pjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zlVxCCMFwAC8MD0iQFCurIhDhm/Tlylx78KzhuMLWd8=;
        fh=8OkICghuuSXAsvaghuxI4S3oiov+jrgKDajIrbLyjjg=;
        b=LD1Nrye5fLI3QLcoJx7bh75233BcwN27+qkZS98L+o0/3C9V4dB2HTiGWzn/xUeKiZ
         e//a4V9xFl893Td0rscfoh2Fum7RcizR6jL+VaKhZIbvAl45sWTqACLOsxJ4filkDCg5
         xQwJMvHHuapyCWB+hlwsHM/Ri/NoujamKZbvYszaqcMoTot/QzZVCyiZFNWSWTy1EthD
         gV6EEgIcJJmyh6t5n/Oymj49tn2jdUgivsrV8Pr3lSJeu69bubJCBBzEo6GbBjyC7KYb
         ZaK202vADcU35tnplr1l8y5Amw0YuZa0AhtNiE35OWMMrWonAciGagDhRerSVnEAaASM
         j5Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OP8FRvuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05620a44ca00b0077438e11607si8013477qkp.345.2023.10.10.06.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 06:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OP8FRvuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqCyO-0001lQ-Tv; Tue, 10 Oct 2023 09:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qqCyN-0001kl-Hn
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 09:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1qqCyM-0006op-05
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 09:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696945221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlVxCCMFwAC8MD0iQFCurIhDhm/Tlylx78KzhuMLWd8=;
 b=OP8FRvuFaLFEOck3ajmkgJxZr+MRpLRbyHR+DL+EQ/x4NRBjqxPxUyt9BQnpDQT9edz4m2
 p0GCI/HOs21JSShAywEwaGv2oNCQSbCkwjsoTmnPtsXFsSmXyE8R3+FOCoD3ejBpAtI12m
 81XFVKKdwqoSsJUdWpqEy3FgxuqAG/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-8vNqJViDNoSF0u9QwMhj_g-1; Tue, 10 Oct 2023 09:40:19 -0400
X-MC-Unique: 8vNqJViDNoSF0u9QwMhj_g-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-537fb536554so4887111a12.2
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 06:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696945218; x=1697550018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlVxCCMFwAC8MD0iQFCurIhDhm/Tlylx78KzhuMLWd8=;
 b=lfu1VmBUiPEI5UxasnCmS9VNCXqtXiTSA97YiWy2NMyD++ZwDW/hFtixPakgt8jjZp
 SClusQ9ZlwmvYvOdqLC+0FNsqwV4plre5Hx/G/cgmH79mEr3d7suemmxG7Txk85mMmqr
 eieeRFTxApriymycmWcMLjY8l4RWZRB0j/Xvozo+B+06HCyVMjbukXL7yVOEEFvmcbky
 nsYYzXyHwYpCstJUcOYDagHTQigpN9Bo5Mqfw+5gFw5YwJpMRhi2C1CG1h0J4c0esrp7
 F7VBNBC9eH5C12dd8L6VyqbcFVFC7fI2oxqp+QgCZ8jPNzkFCWDAXv5rhOxMconXyKTp
 +Y8A==
X-Gm-Message-State: AOJu0YyPNyU8mZR7HoIdNXNhK8rfvA7QJ2sjTQrABVNMGxNzbeJc1QjI
 Q9drExAKfYIRy7h9DGVLLqxTb9jyPYer7xHTYaWXt4NF8rEu75H6tb1ce5YjKuYUT/iNtLvmoYC
 3m5MYseOC/TvbziHvpgwD7lysQdDc
X-Received: by 2002:aa7:da8a:0:b0:531:9c1:8262 with SMTP id
 q10-20020aa7da8a000000b0053109c18262mr16155808eds.8.1696945218024; 
 Tue, 10 Oct 2023 06:40:18 -0700 (PDT)
X-Received: by 2002:aa7:da8a:0:b0:531:9c1:8262 with SMTP id
 q10-20020aa7da8a000000b0053109c18262mr16155794eds.8.1696945217714; Tue, 10
 Oct 2023 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
 <20231010073830.606570-17-marcandre.lureau@redhat.com>
 <6365e1f5-bffe-ef11-7e9e-55077e66c4d0@eik.bme.hu>
 <cf0800be-046c-8073-96ce-023dd02469df@eik.bme.hu>
In-Reply-To: <cf0800be-046c-8073-96ce-023dd02469df@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Oct 2023 17:40:05 +0400
Message-ID: <CAMxuvazmw=UZxMMztw4azeq8LdL5aBRPJ9FF7mi=UXqh1r2cxg@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] hw/sm501: allow compiling without PIXMAN
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: j5OWQV5A00oZ

Hi

On Tue, Oct 10, 2023 at 4:30=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Tue, 10 Oct 2023, BALATON Zoltan wrote:
> >> @@ -2169,8 +2195,10 @@ static void sm501_pci_class_init(ObjectClass *k=
lass,
> >> void *data)
> >>
> >> static void sm501_pci_init(Object *o)
> >> {
> >> +#ifdef CONFIG_PIXMAN
> >
> > Do you still need the ifdef here if we keep the property even with !PIX=
MAN?
>
> Maybe you intended to remove this help message because the option does no=
t
> work as documented here. In that case maybe add an #else with help saying
> not effective without PIXMAN, always 0 or similiar.
>

Right, I'll simply remove the #ifdef

