Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4B9FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:18:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIT9h-0006sx-HP; Thu, 30 Apr 2026 11:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIT9f-0006ry-FD
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:18:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIT9c-0004zR-UR
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:18:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48374014a77so12729815e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777562295; x=1778167095; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aud8pDPxeNhXNTzV9GXGEznrMjuzzaYfxmv2pzhKJAg=;
 b=qkn8F0WhT662ZT/5mMt+eVxk12dGLf/zH9tD436+z9y+Qomkpev9IALnhoLCMfsWF2
 o4NgcgdRutvwxzivT+WfSoTGKznPDJnBgzjXXtOw+psLQmGMEuNM+HTa160c6uJRkgA+
 DrwOqjVAK/Hqpxsx3exhGX4jrJ3f6M70aLzxLIzz+Lb4BMuM3fp40gBxg3ZrhFqQueNk
 vEB/oelvl6zK0iKskDc4qYOilmfnA709ThDYVbEshN/yKfSG0xS6xlfgfBCl1vSMgiV1
 JVhqwTXrFCYZznqc5jUAnboPJuuvf518vWNmtFmiYeYBYUG0p13bFrFl3Emp1wZ44q4a
 sj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777562295; x=1778167095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aud8pDPxeNhXNTzV9GXGEznrMjuzzaYfxmv2pzhKJAg=;
 b=hdPMF4L60QFS5UPbPNKrnwXAhhqVA4QtSlV6XAXb4AWo64Od5b7y8Vd74i8f2PrfUt
 5vjX/KV4ccUc0Gf+IGk9jGASLEzJ5LRimRPz6Fy+cKMwwgzpszEvbVjLOM5B/b9wWZtm
 u3TBbnjrMHs7mhyJCc7dyNwFOpB//DOawG6+zyRfS1XaAKLqmuAAH119OhBQRFffCHyq
 j0ts7hUlFps1sPZU2R/ffJgXtqLLch0VZYHqqY/IWThDicYeUU0GWgs8Uhy05JvffP+E
 +WMRlZ2gm3Ri7hPI8sRA8+tFbEMKfsIAg111JFvYVCAte6AdH2IvEMoVOvTHssRDXB57
 g4vg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yd/ohvv6u8yr1CWr3TsCTUoRtxx2tC+N+ARAwNfuXMKZ/ZaXFzv627/LZ/oGiVGRBB1W+GlZljw==@nongnu.org
X-Gm-Message-State: AOJu0YzwWRismFWz6/fDUbPlXwEz55BwjYqE2P5mPz48wEnZ9T+AZgBf
 V5FpHE2hNcORfAH9szqairjColCUkFQ6BgR118UYE24YOum3v+7aYwb0OVo7Rf4hWzY=
X-Gm-Gg: AeBDietkNJkZvnG1vXU4FGuyn0yVHz+KtqyyPt3+C1ZDQEUtORvJ136led5X9z2YvlG
 tsmpZnTRV7VT9I/1gRX6vOWsxWk5ZZkjeahXc1Ntmn8rJi2I3x69gO8rTritQVdCxlXCFb5RReA
 Fipm1Gres1RLnRy1/LrIf2ojmyPmPTc0dxGJ7Sfh+CVQgcXjE24gEjtXT1Gu3RhvMswIvys6ayB
 pgWrLHTuJ7qjLHwVKvaQpysYFDzN2x9tdLywGD1tUB83Ah1Wo6A4Q0ss5GAJH7JqM8C0PhE+zYh
 BrMFuqTTiQhgQTUuZ6z6MWb7fWALsAX1wcPGVtIbDKUFoTpCddM9gwZbTgjBH6J6+b5c6tvB+1v
 kImM0IMfXaE/41H5dhRu51kf9lnE/ZFrCzJrl5FHoYzmTWF7DJp57A3dGy+4G0OBwu0h/EyyU0U
 ray1mzF/PJlHL63tKi5Tf0tycBz8CmVP2qtJlHRkWGFDatcuQhoMm78bUVspAxlMRSZxtbMSR5t
 L7N
X-Received: by 2002:a05:600c:3504:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-48a84441004mr54496165e9.9.1777562294579; 
 Thu, 30 Apr 2026 08:18:14 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b76e5c7csm13908244f8f.26.2026.04.30.08.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 08:18:13 -0700 (PDT)
Message-ID: <4f90d39a-560f-4922-ac54-2c975dae249d@linaro.org>
Date: Thu, 30 Apr 2026 17:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
 <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 30/4/26 17:12, Peter Maydell wrote:
> On Mon, 27 Apr 2026 at 20:45, Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
>>
>> Flash devices created in instance_init via qdev_new() hold an extra
>> reference that is only dropped on sysbus_realize_and_unref(). When the
>> machine is destroyed before realization, the flash objects leak. Also,
>> the oem_id and oem_table_id strings from g_strndup() are never freed.
>>
>> Fixes: 602b458201ff ("acpi: Permit OEM ID and OEM table ID fields to be changed")
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   hw/arm/virt.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f62253e1aba..fac825ccd47 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -4032,6 +4032,19 @@ static void virt_instance_init(Object *obj)
>>       cxl_machine_init(obj, &vms->cxl_devices_state);
>>   }
>>
>> +static void virt_instance_finalize(Object *obj)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    for (int i = 0; i < ARRAY_SIZE(vms->flash); i++) {
>> +        if (vms->flash[i] && !qdev_is_realized(DEVICE(vms->flash[i]))) {
>> +            object_unref(OBJECT(vms->flash[i]));
>> +        }
> 
> We currently use qdev_is_realized() almost nowhere in
> the codebase. Isn't there some way to do this such that we
> don't have to care about this because the object is
> parented and gets auto-dereffed ? Having each object
> have to care about the possibility of "inited but
> not realized" devices in finalize seems like it's going
> to result in a lot of bugs...

Why are we creating pflash devices if we aren't realizing them
(thus not using them at all)? Destroying them when unneeded
would avoid that manual cleanup, right?

