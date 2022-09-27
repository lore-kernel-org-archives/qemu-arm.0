Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp722869ocs;
        Tue, 27 Sep 2022 10:22:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qdMTw+UuyMOaKKq70fGa3vDkElKk3e/8bsaXH3bSKwcRyI0CHyTI7HjxCGS17sIlSVCYg
X-Received: by 2002:a05:6214:21e9:b0:4ac:9bfb:e7b1 with SMTP id p9-20020a05621421e900b004ac9bfbe7b1mr22969760qvj.99.1664299324962;
        Tue, 27 Sep 2022 10:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664299324; cv=none;
        d=google.com; s=arc-20160816;
        b=pJQVwjarYc8FWxncYJ1+JhXp/ivjhHIiC6pEg2wPmu5/wPs6qTZeGqBo0oK9BaZx8+
         UE8WQBfdd9rR0owDMK9ykFHnST/6INjKpcAKYEo5YLlpB79WEncrYVr1Mt/2L/lAp9CI
         BhESnNsgm/NpY+VN1aMDI/M243Vms0KHv9hAZgsgnk4DBV8+45aKJ90aL773FLP0kIfO
         0PXGhMJ7Ms6PjXYAf8yTBAU2vI0ijRBjQhObFuiQIfRo/iPzLtrTTMxCnWuR01d0S2Px
         om/c1JPJG+7eTkBW+Z4otHi0jkhttTL3Yii+/37q32BxftbfQjX9BbOhdBN2NIwoodV5
         MCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=v6joseTCJ6Q1ULHJqtMdYQ3ykcU0qv4BHwAMu0wPDVc=;
        b=XZVcjE2c7149oEOWCwkPUweFxgyeu0a1nMuyJGGkZeXWjFWBiDTVLEzGUsfY//xXZv
         nIliyxyFF8cIpQVxTrRhZPA5Wm4XDSvHzCSCWU2rWfy+heqHdn5N+Y5l7KDGD8tBL8RO
         FjNy6OcgU5eBpgDOMAKNNNaU92l2PVjBDlgqSj5vG/zsApHvQasg8/QQIeQikgh1k9mx
         yu21MZTPwp4mzwTLiskN/QDFU21LVulM5rW1CY23M6deM/3Sq48eugZd4/0+mf5WFKWM
         6jg6EjWjUWwjEGLypLC2tkwicjW4qRDlsqLAgfW9q2ZZc3n7zkj6SZ2x0IkV7Fgb5aDV
         Nqtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mi14J4PZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i68-20020a37b847000000b006cec0749c1bsi1205105qkf.306.2022.09.27.10.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 10:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mi14J4PZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odEHU-0004LT-FY
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 13:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odE3g-0003Br-AV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odE3b-0005mC-ND
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664298461;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6joseTCJ6Q1ULHJqtMdYQ3ykcU0qv4BHwAMu0wPDVc=;
 b=Mi14J4PZTm80qVPZZW4gX7jkGTmjywbH8ws769+YneoucXRh0uJcoNqw0XOmFgK22lsfIX
 mH4kH4biD/2PVUG/mhQGHxv8/pdPfk5Zb+6IDwHiMBD7A+1kflGhONK/BezAp6OPu0qjY8
 Wfna/bgCFcuYNKfBwYgd9wOY75zDB48=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-hsA0AwpXMHe5OCqkHYYUIg-1; Tue, 27 Sep 2022 13:07:39 -0400
X-MC-Unique: hsA0AwpXMHe5OCqkHYYUIg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z16-20020a05640235d000b0045485e4a5e0so8272002edc.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 10:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=v6joseTCJ6Q1ULHJqtMdYQ3ykcU0qv4BHwAMu0wPDVc=;
 b=P01B/tLIEu7mdBKFX9LtvghvICSv4Dv7EL1exIC5l3U0Ycb6SuXWqsIzbuUxvL3rpF
 Na2KAWxVdjdRw2gXa4HwJKlOddrGBB7e2cCjGX/HK8rK1oKzakecOpA56XDSC7ERPJrR
 MRmkT7Jj0w9OodBe68a7nh5WBer3KgyK0LKgkclFQa/eS2+3NFH14HK4F2kZ0XzLJIKi
 +j2BnvlJZ/bpAXS/3OEBgUZiGPwSy0dSuwmFR0U6xp4LDWbXoW1v8MB/RPm7gg0Uq0nH
 O5kijjuYpOm/I3NbFeDupj28bZRnCWX2+oQQdgHh79NPOFhGjV15Fezm15cp6fVYj8s5
 sPDw==
X-Gm-Message-State: ACrzQf0p5G/dy9aX1Hz4bBfY9gWg93qc1MD6Ldhtgm5tfPxw0D8GAM5p
 sStOChFaG2yVq0kip9Fju2PZED0OCX5EVQmgnwXrBoEb42XV0rOGQaQNZfu2CjItwbbrOO/RUJH
 V4wT7gptlyzu6Hiw=
X-Received: by 2002:a50:fc9a:0:b0:454:6a56:7d27 with SMTP id
 f26-20020a50fc9a000000b004546a567d27mr28223776edq.73.1664298456584; 
 Tue, 27 Sep 2022 10:07:36 -0700 (PDT)
X-Received: by 2002:a50:fc9a:0:b0:454:6a56:7d27 with SMTP id
 f26-20020a50fc9a000000b004546a567d27mr28223738edq.73.1664298456201; 
 Tue, 27 Sep 2022 10:07:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b0077016f4c6d4sm1048782ejb.55.2022.09.27.10.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 10:07:35 -0700 (PDT)
Message-ID: <51698c38-468a-83e7-5ff0-be2175f1e17d@redhat.com>
Date: Tue, 27 Sep 2022 19:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220927164920.1502219-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220927164920.1502219-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2v2qOtmgSr9Q

Hi Peter,

On 9/27/22 18:49, Peter Maydell wrote:
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
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..356199c9e25 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -1 && errno == -EINTR);
shouldn't it be errno == EINTR?

Eric
>      if (vmfd < 0) {
>          goto err;
>      }

