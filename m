Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1741651eje;
        Tue, 11 Jul 2023 02:22:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFhUC/ZvBnnkNyCde3xnCD1rdA/ZBgF+r+0ZAbwLLMJFdWVVVUXOmgN2rHtyXsJub+kCOs4
X-Received: by 2002:ac8:58c8:0:b0:402:8ecd:810f with SMTP id u8-20020ac858c8000000b004028ecd810fmr20852569qta.40.1689067368183;
        Tue, 11 Jul 2023 02:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689067368; cv=none;
        d=google.com; s=arc-20160816;
        b=hBt8cyEcdPPnbacShiXUobFWltluM6/Pvg399HNqlO268eWOk7Hy8a8sjADEJbkLkZ
         sa0W0yOnlzLs9PVqa8tE4TCMG5rHjWs7YECwksP1HWUX76KRJa2jZMIXd6VINn+NuPNM
         mwtY89yaciFPGtP3Z6ZdBqvZOXFcFlhxjY+lpq5Tb94wQ3wTctYrmkenuLE2Jd86bNY3
         LFGILoDgJF7uJFAPAjy7IUFg48tX2MmOA4NO9xn47VOsHzSSGFxDmucFsdXUSv/sVBiD
         ZqbzIFUZu8jkqwbgcXC0NvZBSvHsWqtHWMqg8C8pRUVInwDB1NI3/Lz7cevjJ2YEmaTb
         5YCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :cc:to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=S05ywxmDG/S4bUS/YWXYM6BzidRIknNHfhea/ObC44g=;
        fh=ISZhyQQp034M2RdAlfkN9fpebr+p+xs3V6UF0eurX1c=;
        b=kMHzY1nKdh2JhFYhsGimsx3aTkyEGLHogpBXx0nCGM/Ac346+EWlU5bWHlioPXbTWM
         tPLLgUoZmtlG/iuA2mtpGQ6I1ew39/zV9QVzJaZPZqsZRt2EcUvEMekqFi/0ajyiZ1d0
         XagwFruJk2T1EqR9+hv6GuZLM4wfQrEhpT9IWH+WK4p8i9SRnfbs3bzLEZcq74A1nFV4
         1adZDZDUPnUTA2OCwiKIaRZd6kiTuxSkFqVhcDXmkTxZwc5GamttlsNATieSX0Feye4I
         ABjBf+XLAZGbqsYf8rzMhLLE1AusCzSRH3Qy5hGan1LYsM8hc3QH+00sNZm0ir4vT8Wr
         bNHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OAD9mAeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a008e00b00403b38260desi653404qtw.616.2023.07.11.02.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 02:22:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OAD9mAeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJ9Zb-0002cB-Ei; Tue, 11 Jul 2023 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJ9Za-0002bp-GL
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 05:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJ9ZY-0005ty-Pi
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 05:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689067333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S05ywxmDG/S4bUS/YWXYM6BzidRIknNHfhea/ObC44g=;
 b=OAD9mAePDhknuMDhVsUCPFrEHVWuvjPLMziOxUO58y0X3luq3gs1KhiqGilImeykrvQNwo
 pSz3vhYys6bv1ftOBGry9AzWn+zLRv8hzuFB1z2NwsrDXshVhKSjMNeEoP9X10slGnqzfz
 n2YzW5eSp8etWvEs8oPERHo0DvnfeUM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-20mDUeXWMhiu3LxtQJjNhA-1; Tue, 11 Jul 2023 05:22:12 -0400
X-MC-Unique: 20mDUeXWMhiu3LxtQJjNhA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbfc766a78so27278615e9.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 02:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689067331; x=1691659331;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S05ywxmDG/S4bUS/YWXYM6BzidRIknNHfhea/ObC44g=;
 b=kyPs13v2vsEtxp9a4huI6fJnM69c0OkZ2Pxu0MwAK6Vsk0mYsE7I2kInFl/Hr88T1n
 cM4Am1USbc7ligk6OyrqFPZB6GA5yeLJMDB7lnmJO+vHgraayeh0zyfaZrzxH6jv4Ta+
 R+9onBOhEnitsx3xRJ89807955k69amQxcjZuRZjZdtKAg5HZuIklbwhc5IYAl9LbSfu
 wYQVvNCbPMP6iQemd+jr2sht6gLc0NcmJxxmiurexV6Ou+dd28D1DDbmPOT6GgPgh1HH
 pBiMTFqkD5TcuUW7ZiIGOf0EK1N7HrJSALRkL/7aN46B9quVKC0AFFM9rLwBd7tFc8Ej
 hSww==
X-Gm-Message-State: ABy/qLYEyjjHXjmDCmQ7iEWZtGjgLmiz2QMCcFTUpGtLGfay34rmu4ak
 vBKLVM5p7M8y8sVyWNW+dC9vOTEheaK4HFjKWM+sfmyaZLW01ZkYSJ2TDlkpBr/N3hPiSvi7rLU
 vg1ea/WKHSpE+
X-Received: by 2002:a05:600c:20cb:b0:3fc:f9c:a3e2 with SMTP id
 y11-20020a05600c20cb00b003fc0f9ca3e2mr6726363wmm.6.1689067331475; 
 Tue, 11 Jul 2023 02:22:11 -0700 (PDT)
X-Received: by 2002:a05:600c:20cb:b0:3fc:f9c:a3e2 with SMTP id
 y11-20020a05600c20cb00b003fc0f9ca3e2mr6726340wmm.6.1689067331133; 
 Tue, 11 Jul 2023 02:22:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d?
 (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de.
 [2003:cb:c745:4000:13ad:ed64:37e6:115d])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d53c5000000b002fb60c7995esm1744300wrw.8.2023.07.11.02.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 02:22:10 -0700 (PDT)
Message-ID: <840d704e-879e-5d13-5bef-038d275e038d@redhat.com>
Date: Tue, 11 Jul 2023 11:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
References: <20230710100714.228867-1-david@redhat.com>
 <20230710100714.228867-4-david@redhat.com>
 <20230710173933-mutt-send-email-mst@kernel.org>
 <b9351bf7-cabd-784c-bebc-a18a9b3f4bc1@redhat.com>
 <20230711044647-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/7] arm/virt: Use virtio-md-pci (un)plug functions
In-Reply-To: <20230711044647-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: E8TmxquJ4e+F

On 11.07.23 10:47, Michael S. Tsirkin wrote:
> On Tue, Jul 11, 2023 at 10:32:31AM +0200, David Hildenbrand wrote:
>> On 10.07.23 23:40, Michael S. Tsirkin wrote:
>>>> @@ -2855,12 +2796,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>>>                                         SYS_BUS_DEVICE(dev));
>>>>            }
>>>>        }
>>>> +
>>>>        if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>>>            virt_memory_plug(hotplug_dev, dev, errp);
>>>> -    }
>>>> -
>>>> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>>>> -        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
>>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>>> +        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>>>>        }
>>>>        if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>>>
>>>
>>> How is this supposed to link if virtio-md is disabled at compile time?
>>>
>>
>> Good point.
>>
>> The old code unconditionally enabled MEM_DEVICE, so we never required subs
>> for that.
>>
>> We either need stubs or have to wrap this in #ifdef.
>>
>> Stubs sound cleaner.
> 
> That is what we usually do, yes.
> 

I'm testing with the following:


diff --git a/stubs/meson.build b/stubs/meson.build
index a56645e2f7..160154912c 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -65,3 +65,4 @@ else
  endif
  stub_ss.add(files('semihost-all.c'))
  stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
+stub_ss.add(when: 'CONFIG_VIRTIO_MD', if_false: files('virtio_md_pci.c'))
diff --git a/stubs/virtio_md_pci.c b/stubs/virtio_md_pci.c
new file mode 100644
index 0000000000..ce5bba0c9d
--- /dev/null
+++ b/stubs/virtio_md_pci.c
@@ -0,0 +1,24 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/virtio/virtio-md-pci.h"
+
+void virtio_md_pci_pre_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    error_setg(errp, "virtio based memory devices not supported");
+}
+
+void virtio_md_pci_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    error_setg(errp, "virtio based memory devices not supported");
+}
+
+void virtio_md_pci_unplug_request(VirtIOMDPCI *vmd, MachineState *ms,
+                                  Error **errp)
+{
+    error_setg(errp, "virtio based memory devices not supported");
+}
+
+void virtio_md_pci_unplug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    error_setg(errp, "virtio based memory devices not supported");
+}


For now (not having virtio-md-ccw or virtio-md-mmio) this should do the trick I think.

-- 
Cheers,

David / dhildenb

