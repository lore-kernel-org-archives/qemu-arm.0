Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp661440ejt;
        Sun, 26 Nov 2023 16:19:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6yAcJy0kN3F6zsoTzhK7fqmkQjJOuOw8jZEkjDIZ4ugLUNntN2QLTWpsxGrzLDV+iu9MR
X-Received: by 2002:ac8:5c0e:0:b0:423:6e2a:1c36 with SMTP id i14-20020ac85c0e000000b004236e2a1c36mr15689168qti.35.1701044343641;
        Sun, 26 Nov 2023 16:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701044343; cv=none;
        d=google.com; s=arc-20160816;
        b=xISvF1nzgR6bLPBFAET7tziri35updZWrGgKRGpwhqWI+Ojh4jJbynMKrrGhjGIEM3
         uQnXh9PRKqNBu1S0diLjybuibbEQ2bHOwSb76fJ5YaJqZJAb7U3bYSIA4wj0ulUaKB5h
         vkKknAMcKoFPKdVXgp+mZ1t3AfEhvD9wHa7KslJGEe149yK95qYEdWOXQ/p81nUyB5c2
         u8661aUmZFPkMxulj9WJTFVrOQREAPnTBd1/ENvJJj8MDdS0RjXMmCG1KA1Ok/AD6icY
         /fC3RWpw1XPaN1Y9S1+PFq62/KfWwNHwKj4oacuyCIVkPaZlCZx+Kest6D/Bbfl5klZS
         0Rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mSPeFLpaQnJGAbfUyNrOGS8HpyRBaanIHxk7Frt78Zc=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=kH+JcLw6cLs2NtCnj42puAeCpBALgtnhbgByByHIVR2caYTfYKPoHBJzo8CVE5BQcv
         yOpJqIlf316NFS3TB4P8aTPBcEyzfvywr3HfW1vPi44/42rPnQA/lpT64f3p9ZhbXUPs
         QIpew0RqGJ87VICjDnw1EqXrrZtAEq+tWmupM0+CDnl/6Hp//viUItAHYD6Op4g8IkK1
         ld6cpqbX+00Dzj0FDzlbWD0sw6hnupN3B/lx9lHNWqViaTqlBouhdVzQY7uxpSdsDxbe
         0rZyYUnQEnw0cJWRTGvLyi7c+R0WDRMvyr7ep25QxdqxtadL5ubT2jbi0y1WU4TX4A9+
         sDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ccj33z76;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd5-20020a05622a5c0500b00423a75d2f7csi3651578qtb.33.2023.11.26.16.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ccj33z76;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PKw-0003V4-7b; Sun, 26 Nov 2023 19:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PKu-0003Ur-O8
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:18:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PKt-0007t5-Ai
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSPeFLpaQnJGAbfUyNrOGS8HpyRBaanIHxk7Frt78Zc=;
 b=ccj33z76VltlLObLkJ0EgHWwBNEEJPDXUIHYDfib6jS3jhoDjbKLS3NzHjab+7xor5JG0h
 uI7lR+S7w/BHulIvUmaQsFB31vWc+NJ6FjAa34iDa5KbVuavoeblZTtiojmpnbbjrymn8+
 95gT1IUtx+OA58GftTmGkzRgZ83PF8o=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-hAg3gQVrOK2-CipQKY69uw-1; Sun, 26 Nov 2023 19:18:49 -0500
X-MC-Unique: hAg3gQVrOK2-CipQKY69uw-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5c5c8ece6c4so525726a12.0
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044327; x=1701649127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSPeFLpaQnJGAbfUyNrOGS8HpyRBaanIHxk7Frt78Zc=;
 b=nH1TOHGrxNto+Soc9RGLMxgrJJ2kVDoNndE2dnJCtyGWbBFbHj9CTcdROiogEjZ3lw
 KTJ6JHUqjEAJScWskFhfEDPbL1Zt6FO0sIICjW1rr3+YvQ9tPKl0ONCbAhzepisBEzyi
 AIhne59Cw50vmaR4rbcNU0DOvnur3+NFf4ZoM/omhtgTTVnunC7XjtU3UIafq32C7huV
 pa6Rr1KjCXVFJE0tnemYuKao2qR9ViUTeGic+fs8yylPq7x8vg/5OpxamXNI8UdSfgSx
 wVXsAxaSNXkfKuMfmjHtV0p+LrhZkcxThQlNoh23frhMX7IyOiJVGQd7KcK1NbahQG7B
 DQmw==
X-Gm-Message-State: AOJu0YxHGLbHmRCZJyARfJpfHBiXV9kJtRCkF2zWW8Ueqq0VqGw23fZC
 XfeRgYuGI4DbalK0fGGvW/V+ULyFD5fCac0LAbVLCYTy3r2Ej7t+4QCkDPvEwdxEbjFizlO0fMk
 SmLn7Xg59/PNKmjxvETYm
X-Received: by 2002:a05:6a20:5491:b0:18a:b5c3:55c1 with SMTP id
 i17-20020a056a20549100b0018ab5c355c1mr10932611pzk.57.1701044327747; 
 Sun, 26 Nov 2023 16:18:47 -0800 (PST)
X-Received: by 2002:a05:6a20:5491:b0:18a:b5c3:55c1 with SMTP id
 i17-20020a056a20549100b0018ab5c355c1mr10932592pzk.57.1701044327467; 
 Sun, 26 Nov 2023 16:18:47 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 ik3-20020a170902ab0300b001cfc67d46efsm1386073plb.191.2023.11.26.16.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:18:47 -0800 (PST)
Message-ID: <da053a93-f43e-4991-bc68-1246496f7161@redhat.com>
Date: Mon, 27 Nov 2023 11:18:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] target/arm/kvm: Unexport kvm_arm_vcpu_finalize
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-17-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-17-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lgpu9J0yyHWv

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 14 --------------
>   target/arm/kvm.c     | 14 +++++++++++++-
>   2 files changed, 13 insertions(+), 15 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

