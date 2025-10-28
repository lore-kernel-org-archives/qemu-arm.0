Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF70CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 10:59:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhPj-0006J7-0S; Tue, 28 Oct 2025 06:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDhPZ-0006Hy-A6
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDhPQ-0007CT-La
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761649112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prRvxur3E09D3IkNRG6V84C1UldRa36MdV8O+6OSW04=;
 b=WB6AkEClwETYTZUXR5tzi59B83ZnwAqHf+USWfw4g0o9tX5KuneCx8+QExSvAYXWQM2h+U
 XPdBGcEtSLdLcAgyTkR2J+kFxFxuc1oCMis3WLgj45a6/vEJTBSi2dI09jMsNvxJJqtr1p
 K3BAE8sYHvqYGaC4tA1TWAHjQ1bTNH0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-5ZA0cN_jPpiR6xvGd8vwKQ-1; Tue, 28 Oct 2025 06:58:31 -0400
X-MC-Unique: 5ZA0cN_jPpiR6xvGd8vwKQ-1
X-Mimecast-MFC-AGG-ID: 5ZA0cN_jPpiR6xvGd8vwKQ_1761649110
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4298da9effcso3642517f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 03:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649110; x=1762253910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=prRvxur3E09D3IkNRG6V84C1UldRa36MdV8O+6OSW04=;
 b=Bo+QaeKl6TeHjYplGqqD5HIFgJhK6EAU17+MmW9nc46W9BGZ/jlgt5awclZLHlvEDH
 +r76HazddTzdBT79oQ9e/tCz8zekrlS1Io7ucousBkbwe+hUMD997mJxEGAmuVMF5nKk
 y1ioeQYStmW0MdI1bSP5Zc7tjalm8eEAvvvU6hagQHBWM6N1r+Bu4sZFljvcQRmXGA8f
 otmMA3CJv+DpBwbb2DpbIFZ95NzZ/OqlqricutU/Dz6mwQWAD5rsnJijmHfCm+FxGKyV
 66nN7z7Sfwl+o+PH/4cN81pyLymwhnh88hwuaUsj4mZwypXW/TznP9CRxfJ3U7+c3G6a
 48vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAv3T8o2oYZS5NeOavqQX6hWqzJbPZkWd1wCvdkgoY5gf1Gsv4DbYZNMhHt5JFhuzg652yxp6xpw==@nongnu.org
X-Gm-Message-State: AOJu0Yxk4D1lI4FvEVCiMDfKYOZJ8y/3iBGvu+tQ7REUZ2dP4fdd87a6
 fFHFiJ02PzZYw9j2RE/5Wbr0O+vtNKfYNVDzSaUFRWh6b4rcl6mm9JbvhlGnxyf5y8nrSz9RyQM
 5CoTP6SgVLH3/zucNwVy/b3uDCwQdl5G0gldodRzBN+AFRfEJvexp9A==
X-Gm-Gg: ASbGncv+2Z5WT9iCxh+HIrcp9GFqhxS4ZdhdAlt/2QvBUjFZgvBiYNYIqiT+5P8Z6eQ
 /fTt6JvJGE9/nA6x2i98/uR/Xmt8hbk5dMTMLMZNpqiFeJSS+krjwavjtX1dp6LsklEB+L3NcKq
 DsMJHqOTkYmD/oN+y+w4ZtIuVCD4JFaIDehxXp/Eb7lGfKiV5PdCkyBfLOn0v7y5+mR3afnx75/
 NUpQoxL1Jd+GWGdNK5kB2mHROBZT0jbxsHaqXxfLiW8VHu35kuxFC/iHBV/qeIa+KvuQQkzlns+
 CotPs3eOKzCp9O8ZUqk3Y47LZ1jtSgp/ahmiize4eYoaRiaTuJxsgAJekGvX06U5CwnrPAeli/m
 eyiKYvncM3oUdxxnJ2AONXl1JhVPn29Nb+YDZ87VxJZ54Cw==
X-Received: by 2002:a05:6000:1862:b0:426:fec1:a58e with SMTP id
 ffacd0b85a97d-429a7e7e29cmr2915644f8f.53.1761649110291; 
 Tue, 28 Oct 2025 03:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp9rVNkQq6idh2RrGzpwdv2s8cE6DDoLxXmMMG8w+B4E/MdwFmM2cx1whPMyJ+wD1m7USDNg==
X-Received: by 2002:a05:6000:1862:b0:426:fec1:a58e with SMTP id
 ffacd0b85a97d-429a7e7e29cmr2915615f8f.53.1761649109848; 
 Tue, 28 Oct 2025 03:58:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbc16sm19084918f8f.15.2025.10.28.03.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 03:58:29 -0700 (PDT)
Message-ID: <628c0b08-dd53-475b-be43-fa5085a32cda@redhat.com>
Date: Tue, 28 Oct 2025 11:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/7] target/arm/kvm: Introduce the concept of
 enforced/fake registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-4-eric.auger@redhat.com>
 <CAFEAcA8=01a34UyL6NFiiYxFP-hd5Bdi7Y0ZQqKFnO8bUX+XqQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8=01a34UyL6NFiiYxFP-hd5Bdi7Y0ZQqKFnO8bUX+XqQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u9TKtrGNuBgtCu8y-mK1ssP3L-3X3jpIMMSBiu8HvQM_1761649110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Peter,
On 10/28/25 11:35 AM, Peter Maydell wrote:
> On Thu, 16 Oct 2025 at 15:01, Eric Auger <eric.auger@redhat.com> wrote:
>> Newer kernels may revoke exposure of KVM regs to userspace. This can
>> happen when one notices that some registers were unconditionnally
>> exposed whether they shall be conditionnally exposed for example.
>>
>> An example of such situation is: TCR2_EL1, PIRE0_EL1,  PIR_EL1.
>> Associated kernel commits were:
>> 0fcb4eea5345  KVM: arm64: Hide TCR2_EL1 from userspace when disabled for guests
>> a68cddbe47ef  KVM: arm64: Hide S1PIE registers from userspace when disabled for guests
>>
>> Those commits were actual fixes but the cons is that is breaks forward
>> migration on some HW. Indeed when migrating from an old kernel that
>> does not feature those commits to a more recent one, destination
>> qemu detects there are more KVM regs in the input migration stream than
>> exposed by the destination host and the migration fails with:
>> "failed to load cpu:cpreg_vmstate_array_len"
>>
>> This patchs adds the capability to defined an array of enforced
>> register indexes that teaches QEMU that some registers must exist.
>> If they are not exposed by KVM qemu fakes their presence in the
>> preload phase by adjusting the size of the cpreg_vmstate arrays.
>> On postload we make sure to ignore them when analyzing potential
>> mismatch between registers. The actual cpreg array is never altered
>> meaning those registers are never accessed nor saved.
> It's not really clear to me what we mean by "faking" these
> registers. It's definitely not the case that we want QEMU
> to think these registers must exist -- they really don't,
> and for migration from a new kernel to a new kernel we
> shouldn't include these registers. We just would like to be
> able to ignore them in the input migration stream so we can
> handle the inbound migration from an older kernel.

yes maybe I should use a different terminology. Those registers are
"faked" from a migration pov only.

among the provided enforced regs, we first identify those which are not
actually exposed by KVM. For those only, which I named "fake regs", we
tag them as "they will be missing in the input mig stream but that's
expected and OK". We make sure we provision extra space for them in
cpu->cpreg_vmstate_indexes/values on preload. And in post load when we
compare the input stream indices with available inidices, if they are
identified as missing, we just ignore the error. That's it.

Hope this helps

Eric
>
> thanks
> -- PMM
>


