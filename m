Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14368ECD6D3
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 18:15:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqEjk-0002S9-1A; Wed, 11 Feb 2026 13:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqEji-0002Re-Rw
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 13:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqEjh-0002ry-0d
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 13:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770833686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTFM3pmosNVVouzhnVqRfXyBuDFHw4cDpdky66gLEdY=;
 b=NrbMbuGWbG0hYjWWCjF890xz5WHejN2r/o2akWILGUCivBSdp+G4IR7Yv8PcXFGlEaLv1d
 H2Hd/MKa+UmNduqW+yE71NzBV3evGqHQd/18Y1nvNRccBCqNh+6Vx09tCtVbBImn7K+dEF
 w66wAP7mnc+FTqVb4BoM9hmKYZ/gwzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-oTrDsuWkOJ-AS9ySyJ1KmA-1; Wed, 11 Feb 2026 13:14:44 -0500
X-MC-Unique: oTrDsuWkOJ-AS9ySyJ1KmA-1
X-Mimecast-MFC-AGG-ID: oTrDsuWkOJ-AS9ySyJ1KmA_1770833683
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso70486445e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 10:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770833683; x=1771438483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTFM3pmosNVVouzhnVqRfXyBuDFHw4cDpdky66gLEdY=;
 b=qmk5ntCdJPYIhn/5v+fXJ16wGO4MvmC9vXU3/iC8Afja9Fv3aLwO/nEpMohRGLI4PH
 +w6M28BKO0YUtpUZlP5vqOWk4Qezqb5m9y96Ek984nHsYPZl9umUm701FCQnD3XlD1E/
 PtrzDIWPz7ClVfzZjQkuiGFPLLXYXNPdWjVipcB/rGoMFvCcrRQxFS8HKEIPFT+zUE2y
 uXi8qhfil1fVqqzexVFeiot7X+hgTntEAQ543KZ9FR/FwdSj5HOWpDYlPjWb+Fm/KSzS
 QvGQDWIOieUcu/Y4E4IHVDwDk6RjKWxhVjf3Yhu2FCEuUaF4AHTViiluxO3I9jqD5bkw
 An5Q==
X-Gm-Message-State: AOJu0YzeT/CSUiXXuTKdreh2IOtzelrV0ImzJISq2YZtqiefhH2azpBd
 dFmW2s43KUI5LafRBmF3qDlyx1FieWC/n+XAYnnPpAIt5/led8Y6FFDMpYbsjKAYLhIqD3HIhN7
 pHWVZrgsrBJKFfSXju5bpd4VvWI/g8CtSxDw30VWCVECaavfTnWwLHg==
X-Gm-Gg: AZuq6aIbru1hm4c1l/bjQdwMU7/GjPLy32xquCqcjrnOM9SwdbbHlqIdnvLv7xJFIvy
 H/IB9CgawYnerkWNNMZ4Y7w3lRR25dFhYW8uoZF7FbMQsxT9GWsuC3kfVPi8mwCxStsm6pJ/824
 7bCsKNkG4UyiyOR0DbnC42sp/5fkTeUspfdqwj6JVCyZoK3Zrkby5SI0lNCoMsaCft4uBNGcSVX
 cRWN6meTJNYv2jI5Kcy/gWC5lDMEowAk4ScJO3zDxA6dUmcNv1+e7kqL5GnNHaQCJEpWXAk1vYg
 XXa3LM88exh+Gogb+++rYIVmA/0wLclF24Fcq8fxxirKp4my/P1ET4JMyQSzDbdcpM6c5KJrcbA
 FheEx5rE0Bzm28qe8KcPEmdO2zpWUg7Q8s7lkBaYashRSEURwjoJBG9Dx0aNDaql8pFe7sw==
X-Received: by 2002:a05:600c:4fc6:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-4836571fd03mr881095e9.34.1770833683113; 
 Wed, 11 Feb 2026 10:14:43 -0800 (PST)
X-Received: by 2002:a05:600c:4fc6:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-4836571fd03mr880775e9.34.1770833682733; 
 Wed, 11 Feb 2026 10:14:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836131d52bsm14716155e9.28.2026.02.11.10.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 10:14:42 -0800 (PST)
Message-ID: <e66e82d6-0953-49f0-9d84-bf2776e8f3ce@redhat.com>
Date: Wed, 11 Feb 2026 19:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com, jgg@nvidia.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260211083415.133534-1-skolothumtho@nvidia.com>
 <20260211083415.133534-4-skolothumtho@nvidia.com>
 <aYzFeMh1szhJlJJk@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aYzFeMh1szhJlJJk@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GeN33F3Yo0ln5s_QWj8Viwj-_nUBdEkNOhT2X1Z9bkA_1770833683
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/11/26 7:07 PM, Nicolin Chen wrote:
> On Wed, Feb 11, 2026 at 08:34:13AM +0000, Shameer Kolothum wrote:
>> For cold-plugged devices using SMMUv3 acceleration, the vIOMMU is created
>> before the guest boots. In this case, the vEVENTQ is allocated when the
>> guest writes to SMMU_CR0 and sets EVENTQEN = 1.
> [...]
>> @@ -1605,6 +1605,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>>          /* in case the command queue has been enabled */
>>          smmuv3_cmdq_consume(s, &local_err);
>> +        /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is available */
> Nit: though it is just following smmuv3_cmdq_consume(), it'd be
> likely clearer to verify the EVENTQEN in the callers.
>
>> +        if (local_err == NULL) {
> Does eventq need to rely on !local_err from cmdq?
if local_err is NULL we can safely use it, no? Or maybe I miss your
point. maybe test !local_err directly?
>
>> +            smmuv3_accel_alloc_veventq(s, &local_err);
>> +        }
> Should probably validate s->accel before calling it?
it is done in smmuv3_accel_alloc_veventq now
>
> Nicolin
>


