Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DCECD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 00:33:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX6sa-00088Q-3K; Tue, 09 Jun 2026 20:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wX6sY-00087s-4N
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wX6sW-0005lg-C2
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781051586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQgjVoHP+HMrLVqpIkTQfBSC1isXoRhqhcoB8tKIJUs=;
 b=MbTFdH/qAqfDGGMMW2/emo5TMvjFef05KwI37GGjUy/GM3PeKwaOnw8dFKmGFua92bgEMx
 eLVexewdoxmcy3S2a48nA+m+Ch1kfOMm0/nEUmYx0/OgXxVaiFy9mAFbGSzjEHxcj4oS2c
 GJJZHrnIehUrjXg/ErJ4fbpIfXwSm98=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-_dENorh2PaO8wihc5uVlQg-1; Tue, 09 Jun 2026 20:33:04 -0400
X-MC-Unique: _dENorh2PaO8wihc5uVlQg-1
X-Mimecast-MFC-AGG-ID: _dENorh2PaO8wihc5uVlQg_1781051584
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-36bc380fbf9so6002398a91.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 17:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781051584; x=1781656384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQgjVoHP+HMrLVqpIkTQfBSC1isXoRhqhcoB8tKIJUs=;
 b=ECqIvJocWCg1pxktatrC9ZTFPMHphqQFpfwO7kRaIYa8K7ZJl7iwK3fme7rRxw0PcE
 Uj2fgjfQiYYl1kW4+h7VMAqqNLNQdkIO+TuYUie+kNa/F5k3YYdOQTd7QClrXjBYVvvK
 lbCUIWXfk+j2PsqsZ+zVEYmWYMpBYwRnRjpY6M3aAxCm2GzQrwtUapykWcJO9U39yAHG
 REk1MC2JOl9/HdGRTw2YUGFzES/aIU2vWPcd1flr5lGxk4WFG29Or/KejybF+39VBsj8
 2Mfgv5f8pDLyw0+DUiiNTH1j1J5gF61YbNbnq+pe3cuzBehPGQFFRZN5g/psq6jf+yBC
 s+4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZBous4iLCZ4LrAW3Jge3ZvlBXuoNaom+hyqWBtp1QZOEqExPSTwBSddruHCnav+d6OZC5CWOvkQ==@nongnu.org
X-Gm-Message-State: AOJu0YwRObsUeWuE4HN5c3aqjXkcAx9K8vXWOU8N0SeTWB21/19gHeGl
 IRLrSnuK2kmpa2Mqu3X1Ie1fJFlxzLh0ZvONJ1gCy+5PlI5yGhC24Q7DgJ6N24fmVytwiqL2H3p
 wts4qARMZICp55UHTfXIQpb3t7YRck9wYUjqQEobo30eay6sqcvPZtw==
X-Gm-Gg: Acq92OHnlR6rxALz8tmR8WoctG4/WYv4SF3vq2OiGObjGIPg+VopPPGpTA8i2+liawk
 PeMsXWFHpb0wLgNa+UtvsPux4DJqa59rgUksxES9ZnCC3STRdNnipNDfmNu+8TY6eFRCU56yjft
 Dvp3y2WMqNYzqyAFbvHjifXwNnTMAuAQOngP71as8iZez1gzdqWTZj7k9mZ30QRdlE4TKJVLwIh
 h+MX01Lg8Q6TdGmGIfpfSca/fknWIPRa8bPW7Qq9eT6Wzae1mTKwrgfx+3Hsqx/zPhPvYgxdLpJ
 mSfxi84xGof5cIGcddOj4VWSttB3W7ZogTv+1CLQKY8e2YRLVZnyAbw30daOcFalIoEb7HETMjb
 qnhRuzkmCbCyXelDou81n+ddfLv9Q14F/z+cLlS0abyu9sqWC78QeE9g9Szx+7L8pz1rl2VWZAO
 M=
X-Received: by 2002:a17:90b:35c1:b0:36b:71e6:3e01 with SMTP id
 98e67ed59e1d1-370f0678ed1mr23905950a91.16.1781051583526; 
 Tue, 09 Jun 2026 17:33:03 -0700 (PDT)
X-Received: by 2002:a17:90b:35c1:b0:36b:71e6:3e01 with SMTP id
 98e67ed59e1d1-370f0678ed1mr23905926a91.16.1781051583007; 
 Tue, 09 Jun 2026 17:33:03 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37626873b88sm470376a91.0.2026.06.09.17.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 17:33:02 -0700 (PDT)
Message-ID: <b9545e94-43f9-429f-a5e6-14544b200db8@redhat.com>
Date: Wed, 10 Jun 2026 10:32:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jugraham@redhat.com, shan.gavin@gmail.com
References: <20260608001821.850921-1-gshan@redhat.com>
 <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiapywnJY64G7nUK@redhat.com>
 <21664978-9a01-4ff5-8213-5bd5d93750ae@redhat.com> <aig-b8zPDGGCfwTY@x1.local>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aig-b8zPDGGCfwTY@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMq3QL8mHRQjTE22mr5-_q6FMugdy9yiV5TWDewChmw_1781051584
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 6/10/26 2:25 AM, Peter Xu wrote:
> On Tue, Jun 09, 2026 at 12:08:34PM +1000, Gavin Shan wrote:
>> Yeah. Apart from the option of adding a new property to MachineState to disable
>> the check on the max bounce buffer size, we also can make this existing option
>> "x-max-bounce-buffer-size" official and officially supported by renaming it to
>> "max-bounce-buffer-size". Lets see what comments Michael or Peter will have.
> 
> IIUC updating max-bounce-buffer-size will be the last resort, because I
> don't know how to properly define what is the correct value.  When it's
> prefixed with x- it's indeed more problematic..
> 

Ok, thanks for your confirmation. Lets rename 'x-max-bounce-buffer-size' to
'max-bounce-buffer-size' in next revision. I plan to have two patches for this.

[PATCH 1/2] renames x-max-bounce-buffer-size to max-bounce-buffer-size
[PATCH 2/2] does what's done in this patch, inheriting 'max-bounce-buffer-size'
             for virtio device from its bus parent

> Two pure questions..
> 
> Question 1:
> 
> I want to better understand the failure case.  I don't yet understand why
> it has anything to do with page size with the parameter.  Say, shouldn't
> virtio-blk's DMA requests in form of less-than-page-size, then normally it
> should work even for 64k psize (as long as the total of buffers to map goes
> beyond 4k)?
> 
> Maybe it's because there're a lot of concurrent IOs/DMAs hence it did use
> more than that?
> 

I think both are affecting the bounce buffer. In the failing case, the debugging
output indicates the length of the DMA request is 64KB while the max bounce buffer
size is only 4KB. I believe concurrent DMA requests also bring pressure on the
bounce buffer.

In my failing cases, I received the following output with the debugging code.
They're revealing the length of the DMA request is 64KB, aligned to the guest
page size.

Output from qemu:
virtqueue_map_desc: PA=0x420025b0000, size=0x10000, current_PA=0x420025b1000

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 63e2faee99..c038a62717 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1618,6 +1618,8 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
  {
      bool ok = false;
      unsigned num_sg = *p_num_sg;
+    hwaddr saved_pa = pa;
+    size_t saved_sz = sz;
      assert(num_sg <= max_num_sg);
  
      if (!sz) {
@@ -1641,6 +1643,9 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
                                                MEMTXATTRS_UNSPECIFIED);
          if (!iov[num_sg].iov_base) {
              virtio_error(vdev, "virtio: bogus descriptor or out of resources");
+            fprintf(stdout, "%s: PA=0x%lx, size=0x%lx, current_PA=0x%lx\n",
+                    __func__, (unsigned long)saved_pa, (unsigned long)saved_sz,
+                    (unsigned long)pa);
              goto out;
          }

> Question 2:
> 
> Quoting from commit message:
> 
>          When the GPU's driver (NVidia open driver) is loaded on guest
>          bootup, the memory blocks residing in the PCI BAR can be presented
>          to the guest through memory hot-add. The page cache can be
>          allocated from the hot added memory blocks when cuda-samples is
>          being built. Afterwards, he page cache is sent to QEMU's virtio-blk
>          device as part of the DMA request, the bounce buffer is used to
>          accomodate the request as the corresponding memory region
>          (MemoryRegion) is a RAM DEVICE region in qemu. For this specific
>          case, false is returned from memory_access_is_direct() in the path
>          where the DMA request is handled.
> 
> I don't think I know well in this case, but if you say the PCI bars have
> page cache in the back, does it mean that it should be directly accessible?
> Maybe it's about this line:
> 
>      /*
>       * RAM DEVICE regions can be accessed directly using memcpy, but it might
>       * be MMIO and access using mempy can be wrong (e.g., using instructions not
>       * intended for MMIO access). So we treat this as IO.
>       */
>      return !memory_region_is_ram_device(mr);
> 
> But then my question is if this is a legal case can we loose this check so
> that we don't need to use bounce buffers at all.
> 

It's a nice point. I ever bypass the bounce buffer for this particular
memory region, and it worked for me. However, I don't think we're able to
do it because the memory region isn't directly accessible by nature. The
accesses to the memory region is handled by 'ram_device_mem_ops' where
{ldn, stn}_he_p() are used in its read/write handler. They're different
from memcpy() since the data endianness is well handled in {ldn, stn}_he_p().

Thanks,
Gavin


