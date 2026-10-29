Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042AD606A31D
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 17:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ba5kmvvw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMTZM-00047h-Id; Thu, 29 Oct 2026 13:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xMTZL-00046v-HG
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xMTZJ-0007A6-PJ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 13:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793293537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=exC8sWPTtqMZ/TIUpsLEC8Wm++xmngwqUQfgQSIKnF4=;
 b=ba5kmvvwreZrma6UQRPt6oInw4Pt4dca7xUzd70mvsBCilDtUuU6zo//YaNtC/R9qq1dlX
 Rt5XphjCHYcMsOGR1HgM8+VIrb7jQsuIzBAl1mv8Lzu7glsBZvgMsV0Uw1vf1bzqZtlRhK
 b0T+31/aCeqk72Kd9iF+odp0uAzNbsI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-_FXrxnNDPc23Zpxx8JFCWw-1; Thu, 29 Oct 2026 13:05:35 -0400
X-MC-Unique: _FXrxnNDPc23Zpxx8JFCWw-1
X-Mimecast-MFC-AGG-ID: _FXrxnNDPc23Zpxx8JFCWw_1793293534
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48e0461e040so1886339f8f.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 10:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793293534; x=1793898334;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=exC8sWPTtqMZ/TIUpsLEC8Wm++xmngwqUQfgQSIKnF4=;
 b=0jXCFEHoratFXsSh4s5CL/QZ6/ue/Zp4kxyNfgf6NAcdiIjqq5s+Vc65Oe2+S4u8i4
 LR2EyFf5qzk5dK05rz41eqZdDpe67eRAbxNTKxsZsLZDRWZZj8R5/LwfgoLGgtWzn8q2
 kEiHgonMND0fpBLcAZ8kfYdMh19GXJbGdwSFBuiz8MO9BrapH7gvk+1C4ApkpftCeLNN
 wXmp2h86NcmOJVB7PTDyB+jXFfZuU3zR6INkI3VYyRk/dMOBS+0hj8UG2sGVMXfMZYXI
 INW17G+fO+jD+zL1UghWeGZ6nslia+QKMZgBKisq/mapgA6zFlPHu29xiLWWnRT1zLvl
 7Z6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzIjtVZOuzcgN1sfVcj0rRkql/HxB3gBJ+bZfk+rP0TKrD7mjOvcgSKpczkhz3cG/uRoXU0NW7iA==@nongnu.org
X-Gm-Message-State: AFq9FYIzJKAvbtZhGFj2Bh17DLDcxzh+pO8lR5hJugG+1QEY3GDS/aCy
 KU1FsSDa6Z9Y2UsjZbmpZIf8YB65hFY9FKud732XmwoEleog+1ouZRgbb+F+NkAK00p8aN0xPax
 ol1xGm7ZDB1XFWMUmyZVKzuZoVRwEqv97bSYhLBDiUdAnhmgZ0SSp9w==
X-Gm-Gg: AYBFou23cfZWIBJafC0CLGh9M710rgBK/9+qCFKHY8e9GMLoxe1zdTMhdq5u1zVqHo5
 lBy4cUxC+guX5TNq90LmFeRkcYycQrEqy3bY6NNFbNX5j85PQHeOs9L7tsPL/sYrFi17vrDArM3
 xPl/8tefJ0Q9SX9iD9bPWX2nbL1GZADs7PynMt9BkRT2lYAIDwFur11hXB6uF7r2jgQnxuaTQGU
 7LXQSszElXGUuq/Zg+0FimGDMsij73pafY/IGiZdYzeEkWxOAkYK6LkkJiA4k+h/UFBjTtuI6uO
 3+sh4zHrknv2A6XxO7veCaz/jAkuQC/2kqLfSxRZ3jIne/DJIzBMwGgiNcA4mrArvdF2uBtYNse
 X5uMeiuAoxA/0UYNix9mO089G4BCW/K8PMhdM1cLQU6cqGA==
X-Received: by 2002:a05:600c:8b28:b0:4a5:75d2:c104 with SMTP id
 5b1f17b1804b1-4a96720304cmr146181415e9.22.1793293534251; 
 Thu, 29 Oct 2026 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:600c:8b28:b0:4a5:75d2:c104 with SMTP id
 5b1f17b1804b1-4a96720304cmr146180835e9.22.1793293533918; 
 Thu, 29 Oct 2026 10:05:33 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.102])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6dfac7ddsm301186f8f.41.2026.10.29.10.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:05:32 -0700 (PDT)
Message-ID: <1d76264a-040a-40f7-977f-948d4db6576a@redhat.com>
Date: Thu, 29 Oct 2026 18:05:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] tests/functional: remove @skipSlowTest from
 quanta_gsj test
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-8-alex.bennee@linaro.org>
 <CAFEAcA_UJ=QMFwdGtWv_wWhRyzoig0_0VC+T21+kFvzv9qasoA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA_UJ=QMFwdGtWv_wWhRyzoig0_0VC+T21+kFvzv9qasoA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vu-HtvgZxX3BrmyVmg6gTMSyIPqn7-L3zLwlBf9dIOs_1793293534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 17.38, Peter Maydell wrote:
> On Thu, 29 Oct 2026 at 16:13, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> The full quanta_gsj test would have caught the regression caused by
>> the WFxT implementation and isn't that slow (<60s) it needs to be
>> gated.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
...
> The other argument against using quanta-gsj as our test here
> is that as discussed as part of a recent docs update:
> https://lore.kernel.org/qemu-devel/20260627063208.33642-1-bin.meng@processmission.com/
> it's no longer supported by OpenBMC.
> 
> I didn't get any response from the Nuvoton maintainers in
> that thread, but I kind of favour deprecating the machine
> type in QEMU.
If nobody seems to care anymore, please go ahead and mark it as deprecated! 
We can still revert it in case someone speaks up later during the 
deprecation period.

  Thomas


