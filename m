Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp656859ejt;
        Sun, 26 Nov 2023 16:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6u8mzc0EnJt+Cy6ln8MDiV0k+nB6nbPnTcG/GJGvyiNYTqu6bvvnHnjAVqCF07u8z2EJs
X-Received: by 2002:a05:6870:c83:b0:1f9:50ef:86d6 with SMTP id mn3-20020a0568700c8300b001f950ef86d6mr13860261oab.47.1701043709992;
        Sun, 26 Nov 2023 16:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701043709; cv=none;
        d=google.com; s=arc-20160816;
        b=oJLE1C4HTOr5wcsW/yIkQTC6OjSlwv0Kyo58ewV9yp5/e8poVIPqLS1q8FXejryrhy
         S+fw4lL82o0+Iz/LtP9meo0UDysMY1Q8TmvVcOCqhx5zO3cPOHcLmkFz2i9gYAkFVYKu
         gXYGLnZGyvWxL32L8XU7F3ZFuSSCXkXaoZMWETSlpFl9HhJTb3bv6ieNaWXMGJkKUbm2
         WobL+9Dwyx1Qy01lP3JftMJoX86BARHQfFL4MKTsaZry8FJYVLmZglt3L/+sJ6B+oEok
         +USOy0cDsvezIAyBZxc/A5G3clpGlpJJcdN72PXcwMcbVLh1jpOp8YuQPL8dqRi7ixvp
         0E3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=76I+5cwv/DofG0W4/FDlxwbCQEIVFc0V//udwOa7evs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=kHIA2RwSC1BgbVCq7yziF+7crkGlHPJDXEj0WZP6WyxvjiqKteuECIuPAhk8KkxHFu
         FPOFIYSUz5vx28cXtZgWkDwVb4t1Q1rRBTHH3SQNEIUm71QjPlidNTDb6Mmw7NWgXf4O
         zSZ5YzKdCUzgd1LDyCXZYnWmX6CLWVSBN64LRimFFpulUVeAkPOXX6MmwsXZlZoODEkc
         lJK3kBSp/n/9YAUOGuOR5AoTKtB0JIz7Pz4nWFlKhGv0pusdLzo8oLg0YTPjVEdPakeT
         0nlr0eAg8FTPaSXFpM7GkOEtUY8aU66BuQufY8lIR7ob4K+k3GDRNOnh7U5n/uVHdBp8
         l/sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cA5QFtA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05620a229100b00767dfe07ec4si7444855qkh.164.2023.11.26.16.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:08:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cA5QFtA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PAa-0007zT-Lj; Sun, 26 Nov 2023 19:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PAZ-0007yP-50
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PAV-000661-Rf
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701043686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76I+5cwv/DofG0W4/FDlxwbCQEIVFc0V//udwOa7evs=;
 b=cA5QFtA0UCX9HXAbKUWa7X4SPI3FeTh02FDNFmyqhrnmglR/T4/impAPvAU+44jGYdD3+o
 Ggec+oGfnzjAvzwMYE0TsfFvioFI8GgW4T48gGEegZMgE7kNCux5CQpV/5gm99/WfXXQf4
 VNr6ihKXh0YBP6t9t04qjrLftXD6K1U=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-dWvUWuRBO4W26BIkMP87kw-1; Sun, 26 Nov 2023 19:08:05 -0500
X-MC-Unique: dWvUWuRBO4W26BIkMP87kw-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6d30af2399bso4156538a34.1
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701043685; x=1701648485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76I+5cwv/DofG0W4/FDlxwbCQEIVFc0V//udwOa7evs=;
 b=kaMxibvJRnzPUVYMfGz23wfm4aVrHDAW9GFoTG7oeoEcnDdweqfT2PHr8EufoQ+L33
 uLKTI206AsN+gqbFsERf1J8rrl2qg9jYarqezeF134+4rtaXcRTaw8LZpvK/edEhIMbA
 ZdPp7tyS2WweH9uVccWONzDEmo3s2lESaSlSfCRUf8Mk3qJQIHXoassfFg84JnOrNLBz
 TEcp5k/XxNnJw34eawC8zKF8+5ygNpvamMHBtkPGVjPJEZlgTFzOncQA54lDFs9M2uy4
 v9cMO069AFTFc8bPoZ0RyWmQKx8jBtzeIcFmhSbjZj1p0q2goqwplDODyHsqPXJ6M8/d
 kw6A==
X-Gm-Message-State: AOJu0YyDkTUg/kWKFbpopskwGyT90hG4ELgS8g31UHJ24rfczwWU1cAI
 45efoKjbGjJyzAy40xb0l7vpIZhyoLza0hqQitoJl2ZHJO/11WMKUkaPRPp1vMs9kxJQzPf69hd
 hn70qyDsT6w+y
X-Received: by 2002:a05:6830:1319:b0:6d8:1e67:d756 with SMTP id
 p25-20020a056830131900b006d81e67d756mr3620059otq.21.1701043685005; 
 Sun, 26 Nov 2023 16:08:05 -0800 (PST)
X-Received: by 2002:a05:6830:1319:b0:6d8:1e67:d756 with SMTP id
 p25-20020a056830131900b006d81e67d756mr3620044otq.21.1701043684805; 
 Sun, 26 Nov 2023 16:08:04 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a632d03000000b005897bfc2ed3sm6390025pgt.93.2023.11.26.16.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:08:04 -0800 (PST)
Message-ID: <9f613dd3-d0aa-492c-b0ee-7da9173fe132@redhat.com>
Date: Mon, 27 Nov 2023 11:08:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] target/arm/kvm: Move kvm_arm_cpreg_level and
 unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-13-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-13-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: TRNgE6e56lTe

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  9 ---------
>   target/arm/kvm.c     | 22 ++++++++++++++++++++++
>   target/arm/kvm64.c   | 15 ---------------
>   3 files changed, 22 insertions(+), 24 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

