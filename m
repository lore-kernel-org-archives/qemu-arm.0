Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1704619ocs;
        Fri, 30 Sep 2022 06:00:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BNJ+M/FaXU3MUTIj5ZTCCSKwzj9K5/NM95ZPzGu4A+MffYzvHfjnZDValPap4cTQzV/v+
X-Received: by 2002:a05:6214:1c89:b0:4af:664e:553b with SMTP id ib9-20020a0562141c8900b004af664e553bmr6752743qvb.18.1664542810332;
        Fri, 30 Sep 2022 06:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664542810; cv=none;
        d=google.com; s=arc-20160816;
        b=Afjl7+GD73Xj515MI/eHIOXTT+OYThaVJAAWtykfzTsvO/pj3iA7RfiE/x42FY2p71
         WnJYP5utGBZeI8X1gULlKW/f0pxWWMBsrS+1Rc497VOPb2NkiuXqcUCzQD9JFP4KucpV
         aPfhhtqjgqNYJlHZA3ZCjCNm2h8BSQbr3tMPNLf7L7/DfevMYg/lotbQ/b3bKwwIiska
         5mOXk0OrKtO0F0luNpL/Px4Q2G/G9Uj1X5rA3//ylC5Wq1NnN68lpx3qE9bNNChIsRET
         b4Qky5FF8nfNdGICZNQRFKwTiSZaxGmHx2aAeRrEGxFaExHTHhH6i5hi5w36WbWDM4oA
         6xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SIPpLvVsXyGSV/6hVBfNJb7FroTAcs3NYjH1ggKZrgg=;
        b=X9Y2aeCEO0hRP+7p/kHGVE2lbK10oYBNcTImYNYoMv3SCUqhqScFgI0zlf3slEwWNd
         NTT5SZ3y4YYZi4LbdlhiY1cEITEtKAJuurNOsqjC8pQKdJTyAStp1rF6ViOgKTair5wV
         vAJe8TmtyPx9gXBl1ijBkrMCfUABbxHBgbRDkMsKJDtovlGKY+/42UJvF2/FrZKuCpEz
         1dD50wC70+XgjuW6tOA6ML8IMPAEFM//Gvth/FPCOm+Vdc1zkpHGq7Cn5UehEM0VyxTe
         /PWL345a5zx5+uksLRaT/hGEzUjJzSjQDm0i8ttitwtVCB29/zuVR6C8PtumfTronwCo
         mPFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FECk4w86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020ad45765000000b004afb3181744si1117499qvx.438.2022.09.30.06.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 06:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FECk4w86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeFce-0006vd-BT
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 09:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeFbv-0006sd-6c
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 08:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oeFbt-0000I6-1e
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 08:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664542760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIPpLvVsXyGSV/6hVBfNJb7FroTAcs3NYjH1ggKZrgg=;
 b=FECk4w86Ni6zUHlwztHufbwr54EazqX1oA87Bunoi8FoVksLbeSL7MypX3/2obr1ywnSlq
 ySuLcd1pZLNSHs4phe3vsVgyVSToPx3Ht+f20yh1sOpRUkIf9E1WUakqsP/BMpH+pqtxuD
 co4fpEYM8plKomvpwTsVIb3CAMMjpzg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-awd52pXnMRu5IbeJxzhiqg-1; Fri, 30 Sep 2022 08:59:14 -0400
X-MC-Unique: awd52pXnMRu5IbeJxzhiqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b003b339a8556eso2040730wma.4
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 05:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=SIPpLvVsXyGSV/6hVBfNJb7FroTAcs3NYjH1ggKZrgg=;
 b=KvB18FKodm8VQBtPGbM4o7A5ejj/DTsqNJ4R2iiiF0VWERTtDmqwrR0yC/74FUsKD3
 Jh+Nw4eMJjANm6v9tYmmaCnAB5fPZTZA63CW6jo4NL6xU953JPqmo1P8gqrS1i+tz9oO
 YOE1n4BDP6YWCZmh+3Z30lTzxZs0MDGKMvnhTUVXqG+v3vJKUzHgRKUJwINezcGepek1
 qPS/vMLyIU6e10eIvILyNwgbv0VAHWLZAIMRf2u26KWCOCNQUlXdDL7B2BkPAmq6IpeY
 3SXAhS6du9Kjpq9KY43RSOMrCqnU0mG1w4SBa+44fpjR0rUgeeT9Cv0YdMWbkZmpik1n
 vp9g==
X-Gm-Message-State: ACrzQf2hfTDYnm1GFnA+gJLliMrpHh7FRBFrLcY8KNTTxVH46gw8YkX4
 b4soZUrFjqVn17qPMkWDD2RV5eIP/ntI0QCsGygl6XcE8DmMw5NmLbfbXFvbLKYjmwfspVTCCkp
 SfiOde/FXj9Zi
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr5791604wrr.472.1664542751992; 
 Fri, 30 Sep 2022 05:59:11 -0700 (PDT)
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr5791583wrr.472.1664542751681; 
 Fri, 30 Sep 2022 05:59:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003b5054c6cd2sm9042899wms.36.2022.09.30.05.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 05:59:11 -0700 (PDT)
Message-ID: <7387a737-21c0-ebf3-2756-b865c7dca04f@redhat.com>
Date: Fri, 30 Sep 2022 14:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220930113824.1933293-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220930113824.1933293-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qoc/xewvgTtl

Hi Peter,

On 9/30/22 13:38, Peter Maydell wrote:
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
>
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
>
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
>
> v2: correctly check for -1 and errno is EINTR...
> v3: really correctly check errno. This time for sure!
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..1e4de9b42e3 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -1 && errno == EINTR);
>      if (vmfd < 0) {
>          goto err;
>      }

