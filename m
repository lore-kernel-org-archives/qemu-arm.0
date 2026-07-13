Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2608C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 00:42:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wj4kB-0000iR-Oe; Sun, 12 Jul 2026 20:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj4k9-0000hZ-Iz
 for qemu-arm@nongnu.org; Sun, 12 Jul 2026 20:41:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj4k7-0004Py-Mz
 for qemu-arm@nongnu.org; Sun, 12 Jul 2026 20:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783903313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zALpRgeuYhXdSugXMHp9pMhVnEo4bMgEkE82Q4hNxJU=;
 b=WXXNu5MzaMbaXlMU1gbqBSQtQnbmRi3vCi5uphlnc7THx8gP+1gLUVjlmbUsSs08HNaAl0
 lbJk9F877UUunkcPaVh+tt862Ph1Mcp+G3/nq/9fFChHqKP9emyEcA3dVvupdJaGdMBvTJ
 3Nd7m3wCr1yHMzDeQqf5q1vVIMwAAtY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-w7BYgFJMMA-xISIDj0AKJw-1; Sun, 12 Jul 2026 20:41:52 -0400
X-MC-Unique: w7BYgFJMMA-xISIDj0AKJw-1
X-Mimecast-MFC-AGG-ID: w7BYgFJMMA-xISIDj0AKJw_1783903311
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84a251c2e3eso833934b3a.1
 for <qemu-arm@nongnu.org>; Sun, 12 Jul 2026 17:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783903311; x=1784508111;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zALpRgeuYhXdSugXMHp9pMhVnEo4bMgEkE82Q4hNxJU=;
 b=qNWJ8oaLkX5edWRbHzPjIKaZx/eaeytS4mrDzt1YrGLHkT275YrvaIlqGbY6N0hfQx
 HUMKJVhlEsFRx9Uo0Zr3tvRv5mHGhbli1nKUj9OGNmWro6ghrTdXYviLc5+bkCanvdOv
 5Nik+H3JyseDg3qRjd4A5S1SBUVEvYZDjZBFaJcbqnWZtfaOlA0XeuIK6f3bNoGytQqt
 N23efjdCdDiVbM12wtoENmqtC7omvjgPyf55dEQoOMSFeindjZhBUgITUrMaRvP6PtD6
 bZXfvVN/UB0oyTovJIzSs/6f2vLYyKjMGkSUKAx9nPTcyVdpfYUOfZ5dJ5ShDt8YkDVu
 kaxA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq/wTJID0AN8/f+/GwlWjE79JMMciNbuHis8xOU9/k0Ith0gANvnWqq5Fbt079BbUubA+0LRb0AYA==@nongnu.org
X-Gm-Message-State: AOJu0YyEnDP5Qsn1QCzx4hrEDaFOdwQ8yYrC6NFLqZS9/uBlSsfRv7Yw
 UTgVZMeL+nIbjEWNlofsdmTHmtZrfKlJr9WOhfEtw0ZLsrxrk93IMyGtVqTMJ/oEkihHQT9gpul
 0OxZn4dtW8ZcAgDmK7ht7W4svhP5k9VLc3pHWeCxLuHGn67Ui7kKlDQ==
X-Gm-Gg: AfdE7clomMCL8iUyBa2+worS2TnC+UcMx2b5YBQU9vGIT/y+6HZLlWhHWOd45fhu/F/
 c/8+rwHwS7PW6igRC4QGDxI7OAWARiEK9h281heRyfi6/OzqSbUytk1lUoOdTsfi7I9uN2zylY8
 Xy/JgkT++qi8N8y0AyEeNGWcVIQ+tGVo4YbLaYx69O5s3FWgYVJmAEB7Gvdr0xN19IlykNaAxl3
 2wzGxBKooelecHyFVnabkckEoXngQY5sUa3cRl1M3rg7E3mBC7b683oYV+IoHJdzip1SLB9/+jg
 6KAJj3KouOi/u+/upcpPHxPASMq9/2UU93XKsocG1koompEkJZ5jn1i7i4qNCRgQNW0d54sZC2p
 Y2/k33ghLaPjrUBcoJdo97irQ+hr2onzkQticNQLx9Xd+f+NBbHyUUA==
X-Received: by 2002:a05:6a00:a20f:b0:847:9aa8:d3c1 with SMTP id
 d2e1a72fcca58-8487078c197mr10333606b3a.34.1783903310895; 
 Sun, 12 Jul 2026 17:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20f:b0:847:9aa8:d3c1 with SMTP id
 d2e1a72fcca58-8487078c197mr10333587b3a.34.1783903310424; 
 Sun, 12 Jul 2026 17:41:50 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8483262a17dsm8553175b3a.4.2026.07.12.17.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 17:41:49 -0700 (PDT)
Message-ID: <8ecc5bdb-7686-4627-a2d5-94c50d7921b4@redhat.com>
Date: Mon, 13 Jul 2026 10:41:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 01/25] linux-headers: Add RME related definitions
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-2-mathieu.poirier@linaro.org>
 <03a39e32-3b15-49a3-a23a-782f8ba25466@redhat.com>
 <alDNbZ4ZI34nPGKo@lpieralisi>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <alDNbZ4ZI34nPGKo@lpieralisi>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mnvjQI08dtUuEiulSTHw-WGUdMKD98FyD0EZjG-YNPs_1783903311
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/10/26 8:46 PM, Lorenzo Pieralisi wrote:
> On Fri, Jul 10, 2026 at 11:09:43AM +1000, Gavin Shan wrote:
> 
> [...]
> 
>> After syncing the definitions with those in (v14) host series, I'm able to boot
>> a simple realm guest (no virtio devices) with one warning.
>>
>>    qemu-system-aarch64: Failed to enable KVM_CAP_ARM_NISV_TO_USER cap
> 
> That's because we need to use the VM instance specific check extension
> rather than the global one before trying to enable the cap.
> 
> It is harmless.
> 

Yes, the capability KVM_CAP_ARM_NISV_TO_USER has been hidden from realm guest
in the (v14) host series. With the following changes applied on the top, the
warning is avoided, I think the changes need to be integrated to [RFC v1 08/25]
target/arm/kvm: Use kvm_vm_check_extension() where necessary.

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3d5e16a21c..4c52ee7e1b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -623,7 +623,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
          return -EINVAL;
      }
  
-    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
+    if (kvm_vm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
          if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
              error_report("Failed to enable KVM_CAP_ARM_NISV_TO_USER cap");
          } else {

Besides, I think it's known issue that 'reboot' doesn't work.

   Welcome to Buildroot
   buildroot login: root
   root@guest:~# reboot
     :
   qemu-system-aarch64: cpus are not resettable, terminating

Thanks,
Gavin

> Lorenzo
> 


