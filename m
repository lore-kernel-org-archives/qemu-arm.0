Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp254398lfb;
        Wed, 1 Sep 2021 01:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/DkO9FblfrrJcF/SZ5XvG5amaWF50gOyt0cr2uqHufGYAKVqE8lGimBfj+xb2FWWvQBfN
X-Received: by 2002:a92:cdac:: with SMTP id g12mr23163462ild.201.1630483749939;
        Wed, 01 Sep 2021 01:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483749; cv=none;
        d=google.com; s=arc-20160816;
        b=bzktcucA3gBeI7RCY9Y4SdNtvA0CX8EWlemAdbLqlxM60NrK25QEeOQT/5H07Eu5lh
         pAnio2yYpo/oyMUK/yoXRKhv0Ifbpww4Vc/vjS7qcxCh/KJUXQ5hADacxCSQ0ZT6AZjs
         eMOOgbtUS6vjuF7aEUN5WHi0MKgvucjD2whGpWOQP1kKvbguNZhAZAX0hBaU/pBAfnAP
         hXoQt+eF4PZU2mf/ZQLgSwWUKarKDG2c+jD+xdVZwK1y6mDRk8+Iv6bkLIOAm+rXrC/a
         r0Mlis5biBBeAESFIaNuk8b3RNsPj32LhrEeBRpmRauxExWq6iXQeAc6jF5pyVEaLgDu
         MYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UhY85mgKT2w6kezqC9Rh2DH+ypHWLJYfSggJov8hoEQ=;
        b=j+lcASP23rdtNfSx3GTXAQQ4ce0MwwYo8lDU1ubT2Ve9fdPzHZRWvgogIGKKF2s4RK
         xQ6cGiu4N9rYtH5KCPFwdsZAUzE0xW3kz6qKTZZMc42E+S7NbstrblPROU8N7ZoGdcHL
         jZNq9FbGR+8tRsgsNy8waYwmvQRuhz6XESkbN/mhHjGyEpMgH9Dk7PpdbMxcGNJfHsPn
         Me0IKa20Pvtxw+0LsfcRaEUXiV0P8mBa1qphJI/K3CXUrQg5ZuuiR7a4opytzo9kBIjo
         J7/G7Poda3OIxyzIlKuQ5rzhTEuxI4oTDfkgiVitmN6pbal4DQcqCw82r1bz7HyiW41c
         uJmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Igrm3SLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si22280931jak.36.2021.09.01.01.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 01:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Igrm3SLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLLIz-0006Ui-8i
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 04:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLLIj-0006Em-5J
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLLIg-0005S4-Pi
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630483729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhY85mgKT2w6kezqC9Rh2DH+ypHWLJYfSggJov8hoEQ=;
 b=Igrm3SLUtmazg4o2nlcCpYiap2TFSlVeNQGuDbE4ORNqfUAOKiAlgUXVsPY9+nHvZ5mWMU
 F38Xk1lh6sqLfV1ouB/VToRGZcC/OXwr+HlFJSDH3kDDlrDvKqXrq5Vhn8XVoxvWqaS2xL
 syQ+VazSOFmODntlyTnr2CDOyvCMcNQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-zFre64t3PzqEI21JEIgUzw-1; Wed, 01 Sep 2021 04:08:46 -0400
X-MC-Unique: zFre64t3PzqEI21JEIgUzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso2457406wma.9
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 01:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UhY85mgKT2w6kezqC9Rh2DH+ypHWLJYfSggJov8hoEQ=;
 b=Y79FRJLXkCKZ8+l2uAOYN92B/ZJHpLB8r/VnYX46nKZd4tG9h6zPQd2fVC0ZytdMPV
 Um8ht3dcTIzhdmT8Uv56lDdtdftSwWEfezYveNgcz6YcOj6yVXXDkGQjsTbkPU7Yai48
 jWVEvaMjv1ZueUySFUCgc4Q9mMVWDxdAlGCROBFrJZiTFBe7COvyK70ZcqpRpvBQro8s
 n306TBNEZafAhsBaX8d2ZpAO0HwJf3vxN7GiMNaTDfaaUHZqH6O3lyVuThKQu+erqleN
 fC7fjTo1nDsTH3LI19c6rNEHcwpry8S98FZDm9AqH4oFk0f6plPYXB5pjGtBVFPgZVxX
 72Iw==
X-Gm-Message-State: AOAM531XjVyPaUDQIgpdmBUTHHcsAzuU763ybcXtDKNgaipqoa10oeuk
 jAxa8m6uqgQAnOYf5FSS8qfovvPT51hx+ypaJYbHma9EmGGOuob0LmXQ1Cqz/f2FtvSkEVAudU3
 8NgkAdMtb2aZ1
X-Received: by 2002:adf:b789:: with SMTP id s9mr25620022wre.315.1630483725570; 
 Wed, 01 Sep 2021 01:08:45 -0700 (PDT)
X-Received: by 2002:adf:b789:: with SMTP id s9mr25619990wre.315.1630483725320; 
 Wed, 01 Sep 2021 01:08:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832f4.dip0.t-ipconnect.de.
 [217.232.50.244])
 by smtp.gmail.com with ESMTPSA id m186sm4742695wme.48.2021.09.01.01.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:08:44 -0700 (PDT)
Subject: Re: [PATCH 1/1] hw: Add compat machines for 6.2
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20210831015426.101188-1-wangyanan55@huawei.com>
 <20210831015426.101188-2-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <53f7e1e9-8394-e606-26a4-c559479a4f25@redhat.com>
Date: Wed, 1 Sep 2021 10:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210831015426.101188-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3MfuMlYiHUr3

On 31/08/2021 03.54, Yanan Wang wrote:
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
[..]
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..4d25278cf2 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_6_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
> +    ccw_machine_6_2_instance_options(machine);
>   }
>   
>   static void ccw_machine_6_1_class_options(MachineClass *mc)
>   {
> +    ccw_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>   }
> -DEFINE_CCW_MACHINE(6_1, "6.1", true);
> +DEFINE_CCW_MACHINE(6_1, "6.1", false);

For the s390x part:
Acked-by: Thomas Huth <thuth@redhat.com>

