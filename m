Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp312945njb;
        Thu, 8 May 2025 03:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxZSA5ZhTjrgpYsgtYnSztGAE4X88XiFiC18HawPby2o1o9IW280+B1QKc2S4U7ov95tw5YPs+DNoxLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGWUYYclH+JJcTUeER9LJgoi4XUZjynIG9qzokcMfw6/NKKsfED48Tptdw9R8JFwRUQ9lEl
X-Received: by 2002:a05:620a:c4c:b0:7c5:5f08:3c5c with SMTP id af79cd13be357-7caf736fb65mr721734685a.3.1746699508402;
        Thu, 08 May 2025 03:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746699508; cv=none;
        d=google.com; s=arc-20240605;
        b=lpl6AEX31YxMYR64SBbn6VE6HY2A6OJzQbotehLg2CPUVSXQQXIeEIVqbG40dlJMgD
         nHUyd4AbujxT5Ewakm/nReb/++Z77v5w65atWFlRU2ev7wphBFT7kCzbLjX7QmvF8J/d
         bOdAaGfpIANYoPvwnZaKAM/+PBo8bAQ5fImgVoKiwJ73wbTerbgP29z6k3/jez/6G0W3
         DK6A9zVmb4UbbXzUq2LmMlxYypEmbqQda9j/xvl+QSCNBUIbvPpWA9fuHrn7yFnj9G6P
         /zPgdKkQj1sIZNkttwE4EelZmwGVxixX5GZz9CJLbasUl7KnvoxCp0eik61rcF68C7kd
         WAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Y7IGK5tGx/D08sFxWKPxYdmSinxsEigmwS/bgd5uDNI=;
        fh=OQ5wFXjSKMQh5U4AFQ3JCqjVHQJ8MGgEX3UvbFlP+h8=;
        b=bRDGznUsL2I9DnHrJaeZcrYkoUu1ec/pTiM+L9zoZ+cE6GPZgZpwxlBtgW1heSiwKy
         0+fLyWy+iDAdSksh4wk0A+fU2HAswGrTAPFebfmQ85AG62t9M9uDJK+23Gqacg80Eu5G
         NrWX4eOlgSFIzN4t92uQSqqHx9lqBO2RvB8Gg0mTNDJyRcf8ORi3qi9m5DFZBRlknUt3
         JA3bZVnsMbpHOBLhtZOCU/FdhHzEshnpjuqlseTN+i5VxqT8jKA4aICu2PT53L3jCBc1
         ylsl7bZHLelyRBpKoBvyqUh4wFVa39o7IXDzoC2iWXQFQAHt+M03kmprNEpl0gDwGeYH
         vURg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V8DAMP8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf751f286si407398085a.38.2025.05.08.03.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V8DAMP8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCyKM-0005lY-MA; Thu, 08 May 2025 06:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCyKL-0005l5-2G
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCyKJ-0003zr-H6
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746699481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7IGK5tGx/D08sFxWKPxYdmSinxsEigmwS/bgd5uDNI=;
 b=V8DAMP8iOM/8iuDL5Fx2YgubKxyg0CEjkM0DM7i5hVQJQrd8qo1cMRkuACUfzcojlGdd1E
 S7VgoBpO2gCrJL5k/HWtHak8nyCEeIiiROSG8/m1VarVmiNkzh5b2mT+mNtHw2Yd9LF0xk
 YeQv65MSs4TKYrk4ZQAjXSEpc1yP21Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-GEuLGH4BPo-7eahzyadcYQ-1; Thu, 08 May 2025 06:17:57 -0400
X-MC-Unique: GEuLGH4BPo-7eahzyadcYQ-1
X-Mimecast-MFC-AGG-ID: GEuLGH4BPo-7eahzyadcYQ_1746699477
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a0b7124b5fso498705f8f.2
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 03:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746699476; x=1747304276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7IGK5tGx/D08sFxWKPxYdmSinxsEigmwS/bgd5uDNI=;
 b=cXOOow4xC0kbqsrnj5UTTKq70xmbNCZKflv25sPcaW7N3+lqxw4Vb+MoqMprP5hxEx
 VXdfO3/9KkW5S7VgpuI0nNYvz19lOntji1MS/IqnSAV7hibWGS6iOn0Am4xtMm1pPyPd
 djEatfc0ei0bQUxs/3q5IjRsW+7w/2MNmPUCCslkyPEb6vP2qcB25BVoK0FLEXPE0omb
 ivwaHEKQD4hU/4mfOlXn2H7+OCJ+De1FEpJQy7tQxnnC2Kst/kE7UEQ4NJs3oyz6GjkA
 EB/AZssz01DO07oTahox/ZhXkNJON4fRIdFfdg2rILWr4a5L/oQxEBEIdn6e4WUUIbmL
 1GlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMJEvwnmflejhzEjS62yWTA+99HmeTat/SAiZMyjK/UL2qpifgBN69A+VldQZ/vlX7+bqzhf0Xqw==@nongnu.org
X-Gm-Message-State: AOJu0YwlZCV+vFT5hT22BbqyactwtuZy+aN76lvNWhQ00bvBLEzLXDL4
 28hsQYEVWTEUaeuP5ci7gTs5wdzALv13bejN3kIlF1EOKASTNZhFDoWlkgv27w2iG9NPCQpQ+qp
 SjtBNv6w7r2SOwbfBBZlZ7tJHPTuWdoigJ86D4VMFpMIpmLbXIBZBpjrd8NRSFonMoQBOhIW6B9
 VRMAaixfqldm5v5dQyvNtwAWvP
X-Gm-Gg: ASbGncuo4ZnP1NHZB7W6SHhs6HaLcubPOR9TXz+vtBB5EuxYeptESsTJWyAHZ38TWgW
 Sk2M0mRg1vgvd5lslLxmF1WIkkifuIQCIixQ5/hNwrmWLYwji6/+TgBwl68Xrm0dXzetg
X-Received: by 2002:a05:6000:2410:b0:3a0:b37f:c97e with SMTP id
 ffacd0b85a97d-3a0ba0952c1mr1830663f8f.4.1746699476750; 
 Thu, 08 May 2025 03:17:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2410:b0:3a0:b37f:c97e with SMTP id
 ffacd0b85a97d-3a0ba0952c1mr1830640f8f.4.1746699476359; Thu, 08 May 2025
 03:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-6-thuth@redhat.com>
 <aByB5B02zxvUZo7P@redhat.com>
 <74e85995-f130-40d5-9832-4bae10ef4e36@redhat.com>
In-Reply-To: <74e85995-f130-40d5-9832-4bae10ef4e36@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 8 May 2025 12:17:43 +0200
X-Gm-Features: ATxdqUFDpx4OtZ5HWAZgod8EX-nqVahb0VRjmnZRbJNqJ8h-Mwlgm2BBtCO-KtM
Message-ID: <CABgObfY5AizhM2rAHypRRqt3rTN=eR4EXZwv7SOemHfLFtUG_g@mail.gmail.com>
Subject: Re: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZvq6nUil9eDLE_C8XobhP5n1ZOrV66wegYMG6Sd9ZY_1746699477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: c018SzANIY7E

On Thu, May 8, 2025 at 12:12=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
> > We support the 2 most recent releases of each platform, so for OpenBSD
> > thats currently 7.6 and 7.7.
>
> Sure about that? We claim to "support the most recent major version at al=
l
> times" and "Support for the previous major version will be dropped 2 year=
s
> after the new major version is released or when the vendor itself drops
> support, whichever comes first.".
>
> So for me that sounds like we only support 7.7 now, since the support for
> the previous major release - which was 6.x - has ended already.

OpenBSD does not really have major/minor releases. It just rolls over
from x.9 to (x+1).0, so the supported releases are 7.6 and 7.7.

Paolo

