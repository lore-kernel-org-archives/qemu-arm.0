Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1207482ejn;
        Fri, 28 Oct 2022 05:36:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sQllEDqUVay8hG/ixAAcJcc9SO2r8fbj1+YVK0YIOPrvjEurACUmSyLFrVmEnPFtEM2AU
X-Received: by 2002:a0c:8eca:0:b0:4b8:84db:72d6 with SMTP id y10-20020a0c8eca000000b004b884db72d6mr36608742qvb.49.1666960608783;
        Fri, 28 Oct 2022 05:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960608; cv=none;
        d=google.com; s=arc-20160816;
        b=BvE99sHi3EZXm+dxzNwuIBAIuirpG5p97AlafIe5vF8m+bo8v4zm3hwgzFlaOeOVSu
         xgIeT8BpvNrZC7ZCtp4i9VKr2xRaVax52TpluruwjtnyeEOhxwCtkptjJejioAueOAZk
         RHMvZsdvu/BAVcIK/554C75TW2LbZOLCq+cR5LR2SsDoAqnnCeXhTlzsNNrvVyrlnSW7
         oJbOx6bNuuK1AMnVJdbUU2KDabWpj9r0WTqzxrBu/Ql1wTiASikgF/gfYM/Tf7DBSLeG
         y5hdu95JjBGfq50ehc74kpaGm6BC+Tb8vaRnL0A5BqZKEMFCRL3yFxl7p0QkHd0GNQbP
         OC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mJAl1UihfQy7zmh6HYsyHT66rh+sozeR1hx/iCAwGis=;
        b=HG7k+doV6yA6f+R1JNulcLyr71Ko9tAOnNpL3LjtCIERuVFU3uGPlKqQjAMoYy9kfw
         TllKUQx+ExhJvckplH8mAxAdIV4Zhvvp6XaQIEDspwi1/i2wzcE7xlrjxVhfmA2rTNbf
         k+kgkBiUp/nPRORpRciWhn9UvfymNjtrQcsCm06GVG/vjT6Sjy+8zuEtWZ4sM4xcbhog
         mrCuiIBea1dLUM99lNaOctnF2FT1mUnPPxI+rSvr04s8S2eHOEJvcc/gKhfQWl6Gj2Pe
         hbc+0PZiDfydrWIrHpHDtFx0HqY1hnp4ASk3oQe16bEmGO8dr32LzN7Hr2mRG0iydgWb
         qhjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=mEPf0cMo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020ac8728a000000b003a500251103si2031208qto.403.2022.10.28.05.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=mEPf0cMo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOay-00045C-Qs; Fri, 28 Oct 2022 08:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOYy-0008NR-BO
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:34:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOYt-0004QG-6I
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:34:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so9706060pjk.2
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mJAl1UihfQy7zmh6HYsyHT66rh+sozeR1hx/iCAwGis=;
 b=mEPf0cMor4s0m2TQuUZVGiTiyhmBjXWRHgf23GGwZq3/8E4ilBcFtdSOUUdCqp5agh
 2hQVm43mDvJn/bjs6UoLjLvBlzwmYZiMk19pACMpLMqeJyUvsGEIuJNqyn7CjK+d5niH
 Y2zE1mj6ypgR8Hv1IfES4TRE9K91jqDbatJi7SEJHruxSIaVB/TEVi6FR+E+fIis0Q2e
 SmsYHB8boerae5QyAdax+HmV+X3i0ZxUG1ZNIoyqVT0EyGYo6pcBvGLqkfimWPTyncbg
 R0wa75AyOliq5tISRaml7X2JCVszknNRdpw2pJs8cOBXtljSciRqxQw1G3IgYcA2wWEa
 1b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJAl1UihfQy7zmh6HYsyHT66rh+sozeR1hx/iCAwGis=;
 b=Qo8ki7NtU573vemTcBZCVtT7JpsN2a/qRg132QpWGMAig36umKz00lzRmAGZAKW1AP
 s3PLMcnw9x2HosVVECYTJDydRyLokELNGroBa5KZWRBp+2+JiI45M0HdbBseefEX1VFr
 aD6g/67i+4FrY9MhA5kQr53JuyQ1wF4LcYaQmu2gz/pKr/CH6Fx6nTszWjlOU17O1rwe
 LmFzHfl+zewzu3zkxAmzeftnODOwdEDKS4KK4oIK/7QQiNSr87kps83o9x1TdYTA8XqQ
 sT6168wI3UVrCncH0MFXyqn34V4yMFJ7Xv2GXlP4UvXWYCVqXvLupReeu9Ghtvuks0md
 lY5w==
X-Gm-Message-State: ACrzQf2az/ZBfytPfmBIRha3LlHJGzZ3d3SbVuRgksWswr8/fTFFjspy
 EfSM5+bOgJ0VOsVQ1sqXgGh4FQ==
X-Received: by 2002:a17:903:11cd:b0:170:cde8:18b7 with SMTP id
 q13-20020a17090311cd00b00170cde818b7mr54859667plh.165.1666960449525; 
 Fri, 28 Oct 2022 05:34:09 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170903120b00b00176ba091cd3sm2958620plh.196.2022.10.28.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:34:09 -0700 (PDT)
Message-ID: <b97a7029-045c-923c-13b7-a7d4f01f5a82@daynix.com>
Date: Fri, 28 Oct 2022 21:34:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
 <20221027063705.4093-2-akihiko.odaki@daynix.com>
 <20221027133122.0278d5e0.alex.williamson@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20221027133122.0278d5e0.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d3O7xzbjfbLU

Hi,

Thanks for keeping reviewing. I have just sent v5 so please check it out.

On 2022/10/28 4:31, Alex Williamson wrote:
> On Thu, 27 Oct 2022 15:36:49 +0900
> Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> 
>> vfio_add_std_cap() is designed to ensure that capabilities do not
>> overlap, but it failed to do so for MSI and MSI-X capabilities.
>>
>> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
>> other overlapping capabilities.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/vfio/pci.c | 55 +++++++++++++++++++++++++++++++++++++++++----------
>>   hw/vfio/pci.h |  3 +++
>>   2 files changed, 48 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 939dcc3d4a..8a4995cd68 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>>       }
>>   }
>>   
>> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>   {
>>       uint16_t ctrl;
>> -    bool msi_64bit, msi_maskbit;
>> -    int ret, entries;
>> -    Error *err = NULL;
>> +    uint8_t pos;
>> +
>> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
> 
> 
> PCI_CAP_ID_MSIX???  Is this tested with MSI?

Oops, I think I have failed it to test a device with MSI. I confirmed 
this version does not work, and the new version I have just sent works.

> 
> 
>> +    if (!pos) {
>> +        return;
>> +    }
>>   
>>       if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
>>                 vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>>           error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
>> -        return -errno;
>> +        return;
>>       }
>> -    ctrl = le16_to_cpu(ctrl);
>> +    vdev->msi_pos = pos;
>> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
>> +
>> +    vdev->msi_cap_size = 0xa;
>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
>> +        vdev->msi_cap_size += 0xa;
>> +    }
>> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
>> +        vdev->msi_cap_size += 0x4;
>> +    }
>> +}
>>   
>> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
>> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
>> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>> +{
>> +    bool msi_64bit, msi_maskbit;
>> +    int ret, entries;
>> +    Error *err = NULL;
>> +
>> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
>> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
>> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>>   
>>       trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>>   
>> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>>           error_propagate_prepend(errp, err, "msi_init failed: ");
>>           return ret;
>>       }
>> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
>>   
>>       return 0;
>>   }
>> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>>       pba = le32_to_cpu(pba);
>>   
>>       msix = g_malloc0(sizeof(*msix));
>> +    msix->pos = pos;
>>       msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
>>       msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
>>       msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
>> @@ -2025,6 +2044,16 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>>           }
>>       }
>>   
>> +    if (cap_id != PCI_CAP_ID_MSI &&
>> +        pos >= vdev->msi_pos && pos < vdev->msi_pos + vdev->msi_cap_size) {
>> +        return 0;
>> +    }
>> +
>> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
>> +        pos >= vdev->msix->pos && pos < vdev->msix->pos + MSIX_CAP_LENGTH) {
>> +        return 0;
>> +    }
>> +
> 
> These only test a specific kind of overlap, why not use
> ranges_overlap()?

Done so in v5.

> 
> We also need to sanity test vdev->msi_pos, or are you just letting
> msi_pos = 0, msi_cap_size = 0 fall through since we cannot overlap?

Yes, It is expected that msi_cap_size will be 0 if the device does not 
have MSI capability and nothing will overlap in the case.

> 
> Shouldn't this also jump to reporting the error rather than silently
> dropping a capability?  Thanks,

I added warnings in v5.

Regards,
Akihiko Odaki

> 
> Alex
> 
>>       /* Scale down size, esp in case virt caps were added above */
>>       size = MIN(size, vfio_std_cap_max_size(pdev, pos));
>>   
>> @@ -3037,6 +3066,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>   
>>       vfio_bars_prepare(vdev);
>>   
>> +    vfio_msi_early_setup(vdev, &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        goto error;
>> +    }
>> +
>>       vfio_msix_early_setup(vdev, &err);
>>       if (err) {
>>           error_propagate(errp, err);
>> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
>> index 7c236a52f4..9ae0278058 100644
>> --- a/hw/vfio/pci.h
>> +++ b/hw/vfio/pci.h
>> @@ -107,6 +107,7 @@ enum {
>>   
>>   /* Cache of MSI-X setup */
>>   typedef struct VFIOMSIXInfo {
>> +    uint8_t pos;
>>       uint8_t table_bar;
>>       uint8_t pba_bar;
>>       uint16_t entries;
>> @@ -128,6 +129,8 @@ struct VFIOPCIDevice {
>>       unsigned int rom_size;
>>       off_t rom_offset; /* Offset of ROM region within device fd */
>>       void *rom;
>> +    uint8_t msi_pos;
>> +    uint16_t msi_ctrl;
>>       int msi_cap_size;
>>       VFIOMSIVector *msi_vectors;
>>       VFIOMSIXInfo *msix;
> 
