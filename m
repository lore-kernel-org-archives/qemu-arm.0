Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp665669ejt;
        Sun, 26 Nov 2023 16:30:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcfKSjD91gSnsEVOYeDVIWZa447Pt6XzyQi8jTN+wabWjpzcyRDdCpzzfu8oOIcPoOhjFT
X-Received: by 2002:ad4:5f09:0:b0:67a:3a86:1a5f with SMTP id fo9-20020ad45f09000000b0067a3a861a5fmr3905704qvb.9.1701045025072;
        Sun, 26 Nov 2023 16:30:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701045025; cv=none;
        d=google.com; s=arc-20160816;
        b=tHBmuy3Qj+WwO1/u248km7e3/ODjca9bW/ZgT80SH1ajpUf1f6LjFVYk0LdbPEdQ3A
         K7pVDIPtLuuXDEb075HjLq0sn1bgTuVfH528qkGIgvHbAoqRDqz8sZOQUYGWKr5CxHJh
         TwQBEGH1MY3AGDN7dVSHWu6K4gVFv/BR5byednyuqLbBN+/+oqO8bhSG+Kg0ZWlxhkMy
         E4t3q1RMgXYiy/14A63y40w/yV5FxyNb/T641HgUXO7g4RVXI7llgW6i71i/YQkWneAX
         A90mkHFv4p0XH8sMxru3CcSKjwr1R8tYezBZBe48vA9p8HA6KjUwNhWky86LgUR/+dN7
         dZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MgRhQFyR9B0t9NkPJobP/zNe3X4Ln4TBq2Kx0B8Es7g=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=ncwaXS9v7CFSI6+Bfr0fMl2rNQf7L7EExXw03Xn4XBxy4e9l8GF2WA7EJFvJMoCFD3
         c66MDgY+pa1VmOWB0yFppCPM9RvyzR6GIglP0p43hd7bwkf7NR0VJXEwPKl3SX8nekf/
         u5EPkVbhXFsAtfuhhx8qrOJLMgHNcyjTmx0e+886BeNyyszP2Sz6kWYnXxysR5mpWC2O
         PNyqdUCkXRW5OyGc3TMOQ42ErLEerG3wAlrVeSfHXQ7x4hp47Jpnc1fPTmLW/L5GnSj4
         PbW6UpVQ65MhrtGhU1/ureeQbNxzIboX73Wq1iD/TTDBz4DauuUx53D/rJ5qhmZeFVrT
         tGMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=atVgsGmm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a05620a164700b0077d8876be22si4388879qko.717.2023.11.26.16.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=atVgsGmm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r7PVY-000823-WA; Sun, 26 Nov 2023 19:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PVS-0007m5-M6
 for qemu-devel@nongnu.org; Sun, 26 Nov 2023 19:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PVR-0001Kv-6V
 for qemu-devel@nongnu.org; Sun, 26 Nov 2023 19:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgRhQFyR9B0t9NkPJobP/zNe3X4Ln4TBq2Kx0B8Es7g=;
 b=atVgsGmmKqYX6xYkxkDjUzT3N7Mn18P4RgeGLzgspB6OTGHfiYoajNu85m8SydT3+jx0Au
 kpZrr71fPUxQ86GvUVn9SM89merBVsTr26pG43I/9P3DWcxlAYkdYXO9EJj0o0dKO86CC0
 LdDEiek8Mdmt23KC2b8wbp7E+BssO5o=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-8nCqBaGWOUa8IIt1D6GDEw-1; Sun, 26 Nov 2023 19:29:41 -0500
X-MC-Unique: 8nCqBaGWOUa8IIt1D6GDEw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1cfcf1e9442so4848195ad.3
 for <qemu-devel@nongnu.org>; Sun, 26 Nov 2023 16:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044980; x=1701649780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgRhQFyR9B0t9NkPJobP/zNe3X4Ln4TBq2Kx0B8Es7g=;
 b=qKUGYJnTTIU74mZY7NrOeYYlW2+p+RHQj5x3x608VzK7/F1NeZ0Cq47kcpb/4FzPpA
 2VfwitKvzHtcFSf01Grap4MNMzfvc2OCH5zJH0Zo3I5wYW9bZH7G6H0z34s2DOCwfFsC
 F7qBkhWNQtZa3s68wF2QP0b20QMNU8S4i0rcVDMhqwNEBF6gh85gfHY/L33QSgAJOfyu
 aesgee2XADlnz7bpbr2aZst2wvqf+JmXIe3JM0meJuJW91+ybg1gBsMYypLxNOpT0Jp5
 BZmODrcqvNBOO1RB6RHpP4IX2Zmi2FRbyN6IUgJ8fwlc7TdZlDLEqZXg/a0QdwFc/9AP
 nFPw==
X-Gm-Message-State: AOJu0YziVODpyMjfqFKVt+fPV6RKs/4MlvwffqfztsV2er+Z0G+xPMzF
 s6vRm7RAoJDCzIWbN8TVjLS408wi9qiGGkMKXAeBpbaZu/UsKVQu2Kq9iIqnczxJ/gHYX7x32wK
 d1CbYCDrG2K5Kgxw=
X-Received: by 2002:a17:902:bc85:b0:1cf:6f1a:33be with SMTP id
 bb5-20020a170902bc8500b001cf6f1a33bemr11259712plb.51.1701044980705; 
 Sun, 26 Nov 2023 16:29:40 -0800 (PST)
X-Received: by 2002:a17:902:bc85:b0:1cf:6f1a:33be with SMTP id
 bb5-20020a170902bc8500b001cf6f1a33bemr11259698plb.51.1701044980339; 
 Sun, 26 Nov 2023 16:29:40 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c14200b001c755810f89sm6915410plj.181.2023.11.26.16.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:29:40 -0800 (PST)
Message-ID: <91f4dc0f-2cf4-4a1d-b36f-2fe1cfeb8dbc@redhat.com>
Date: Mon, 27 Nov 2023 11:29:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] target/arm/kvm: Unexport kvm_arm_vm_state_change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-22-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DUfGNQxLmsuK

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 2 --
>   target/arm/kvm.c     | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

