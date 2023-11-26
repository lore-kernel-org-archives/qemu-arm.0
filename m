Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp645316ejt;
        Sun, 26 Nov 2023 15:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEB1wkZh0UlbA1FyDAUzMp7bUD7GuP7wkbUOonkLmjXKAUs36eS/gLOm9QplNGUqnXgXvG
X-Received: by 2002:a05:620a:890a:b0:777:27f9:7e54 with SMTP id ql10-20020a05620a890a00b0077727f97e54mr11928989qkn.50.1701042020486;
        Sun, 26 Nov 2023 15:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042020; cv=none;
        d=google.com; s=arc-20160816;
        b=lEC+yCowP9F8FPjYB8K7HFY7pGW9JLiWc2xT8q66Aa9nmAqxRK9+AbKPFAsWCKgaNX
         f/ZgvKwJBkvIGt0FozvNWIZ7NoXlLri2jyiA7l2EnAs3JlfurSWADCxccnZlmfMSXhOI
         XlFhy3WgWdVHOAUP6dqhRcweo4K0By0BNob4j5Wsmmoc5BQlKJFoMrz7XYbvpEFo2621
         SqroeZoPxPRY6lcRbGlkN7p6DtHCgiKBBMyRkqJ0I6uUsDPf2nSCJc3lddeXITduuIQY
         Klqo4ZqQjh1//LsZfLjl1thNfCBQG3u0PqL7sYDMdZM/TWLsQIgiKS7GIzkd43nIXb3R
         WU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gZKIbTYTvGr8CbY02R6jzJ0PLUSPv4EjopwHDZ4KPP4=;
        fh=vmNK3yMVrORQMySZoJD6mtVJEKbrRsmEdAGMfBLPLmg=;
        b=PNZkny2Yt5/XW1UXBZrZ1QCDjKN32iaZokt8Y7AgGHsFyQosx2ohouWpuESiMSvcxJ
         rZpqLQftnyx6hLM91BkeU+Lfdcimh+vC1E9sQIleC23BUlHv7Isy9OogPuB5MnnZGwap
         5ostHkAbfJFKVvbP6QZssh7YcbWLm36lVJGMPUSGYo5j4noop8wRoWDa71NEdzL7a8me
         A6Z6dns8hrmbkDN8+xg6kJPnLVbvsKYG2bhhsmhxBmxvXdrv6A/eiDixd4Hnkiz6BwRR
         g7gu/wFYEoKBm+TCea9YbAdjcqwpkuBQlo1D23mcGZXN1HDVT1PSlRmktbuB4K/waM4b
         Taaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SL98oEFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow22-20020a05620a821600b0077d84e467dbsi4958479qkn.731.2023.11.26.15.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:40:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SL98oEFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OjI-0005Sg-BL; Sun, 26 Nov 2023 18:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OjH-0005SY-NU
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OjG-0001on-5X
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701041997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZKIbTYTvGr8CbY02R6jzJ0PLUSPv4EjopwHDZ4KPP4=;
 b=SL98oEFGWx1YBoOOage4HfG/VCl3Jl6Q+KQCcVdYQE5I0yfXIlD5CDtTUDnKpOSFVBugoo
 tOgN9gcYJIrS4b6VYewng4OE3u/468RnBQoqJcsYvX9C/NbkiwQ82jdQTABED6h3+LTd+g
 HSre4kXq7md9YAB7QW6f1XRcNRV9qHk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-hXrKLrMyPzWpDKnwWvfa2A-1; Sun, 26 Nov 2023 18:39:55 -0500
X-MC-Unique: hXrKLrMyPzWpDKnwWvfa2A-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2856c8a8efaso3665276a91.2
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701041994; x=1701646794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZKIbTYTvGr8CbY02R6jzJ0PLUSPv4EjopwHDZ4KPP4=;
 b=fHN4lhnVAkvu+ZJ3wJekSdwxf+g+AqGyY+z+JcFEjq3Fq2opJawvoqfViewcF/oSIj
 xPCblGeMOQHdwGy1tDe5N+FxninN0+FqWv4hv2em8vMNLgvESIMR/j/7sLup230yoG9X
 QeMUSgn1xQHLaKTHQSgBVe1uV3+iXi6soNFKeBkv4hvx9VjPA9+apSn/7F38qWEROL+L
 XA3CWbsd0DKn2D1pXXyL1eC0Ive3PO4mZp7Z/2lpex/WmCJPONAY1HvQhDrte2SEYEJD
 91fIw6SJ8gfgjoWcigRvV6PFE3d35GucJMTa0lB9Zpm6+G9dkhlWYWbc7Ix1tFPxqX2M
 d//w==
X-Gm-Message-State: AOJu0YzPRklDZcAbCqmQhDawna5sdNwj3r7QCvhsJtI9gj5hEo6VWLiW
 C4JlyJ7WoQUNWJHlOFMnS0kwgaDmQ7nJmc2kNLJ2Esp6L4o+WdGKqM+uuHmN06MxDjF960yEDWG
 KoOZCZ0aAMBDa
X-Received: by 2002:a17:90b:3b51:b0:285:b906:a3d3 with SMTP id
 ot17-20020a17090b3b5100b00285b906a3d3mr2467069pjb.2.1701041994559; 
 Sun, 26 Nov 2023 15:39:54 -0800 (PST)
X-Received: by 2002:a17:90b:3b51:b0:285:b906:a3d3 with SMTP id
 ot17-20020a17090b3b5100b00285b906a3d3mr2467058pjb.2.1701041994234; 
 Sun, 26 Nov 2023 15:39:54 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a170902ba9800b001cfd049528esm428805pls.110.2023.11.26.15.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:39:53 -0800 (PST)
Message-ID: <24373ab9-f5ee-4acb-b9f9-a281b857dd9e@redhat.com>
Date: Mon, 27 Nov 2023 10:39:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] target/arm: kvm64: remove a redundant
 KVM_CAP_SET_GUEST_DEBUG probe
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Chao Du <duchao@eswincomputing.com>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-3-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-3-richard.henderson@linaro.org>
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
X-TUID: J8ARBZTG+XfX

On 11/23/23 15:42, Richard Henderson wrote:
> From: Chao Du <duchao@eswincomputing.com>
> 
> The KVM_CAP_SET_GUEST_DEBUG is probed during kvm_init().
> gdbserver will fail to start if the CAP is not supported.
> So no need to make another probe here, like other targets.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20231025070726.22689-1-duchao@eswincomputing.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm64.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

