Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76465EB3624
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx7RA-0000je-C6; Mon, 02 Mar 2026 12:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7R6-0000gO-Ss
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7R5-0004Sn-Hd
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772473922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDl7xgq+gBoH2IKSqL3C47Rc8PQTT6uJPJJTixwtt9I=;
 b=aPYEpWn2dyHZUvTSmJKg7K0UMjcKnBCFIBf9hEHbHVAMZ4kke+S4lIr/PNJcBh9GiXuzjX
 ikCnBEyE3mDSr1As0ZsfxtBRFWituG924UeTNMiKSrX9IIyAqkvz6v9tBKloh+0pzA+Y5Y
 aAKYbt0tafc9Uul77oBmpvZwL5RTTv0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-r21dztfJNCCx98NnhybJVg-1; Mon, 02 Mar 2026 12:51:59 -0500
X-MC-Unique: r21dztfJNCCx98NnhybJVg-1
X-Mimecast-MFC-AGG-ID: r21dztfJNCCx98NnhybJVg_1772473918
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b5511d5aso1070417f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772473918; x=1773078718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDl7xgq+gBoH2IKSqL3C47Rc8PQTT6uJPJJTixwtt9I=;
 b=jQblDmYOu4Qrv2nokHuoxanHUnVCVjOHAOfeKimlj3nCrajvQujdUbOjCxL+F6z82d
 7xf6FlAVACXKb71cjYYoS4PdZZehnEoUgmzZzPtf+835r2cTUy7kyDNMhfSrpobMq2nX
 vsV8PsLITq/Ux6+prF2l53vamBc57rYyuIuw7qc3C4zTOOhkuwi6sxR/zo6ynHpMPH++
 pw4kaYj8RoN3EBBsV50DfooZEiT/FCb2ONXRaKyadPnn17h/xKWhZZCB/jZ1Om+Id2wZ
 JNIrOFjWt8WxORO/MpntxDIaY50B3F+yYRfKb83DUbUcqRhVq1loxhCKjS3Plh/J/xeH
 qJjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1zmjBnKEqc2CFz7ZJvLUdH9tSUiZKHYKnnqxXedH+ENcaL/8lKoNgsZe+O92Sx8vWhYk8Qkd8aQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx/yFMimU4rCRTg0O3faBf84Ydq+IZqCEafQfJ9/6AIu6gPMJJw
 uvV6QQxZaNzDiBvy3A4Obpz8rAEcz1IwQ5ZoKcgOqPai+GlniYFF+SEu2Kx0P4qbJURkNZIAhKO
 bX3erhZic0Iec2oDau9G5jlrLa9QOyeOQO9yQjjFk45TDkLHpsUjCUw==
X-Gm-Gg: ATEYQzxWo/Wld3aryk9u4Yk1BlHoS5XKZFp1RI37e5LnhlT6SvET2zhuE4FqDbapSux
 ShF+sq1J0MjcRHJBbTCD8fJhd2GZLoGZWVHUl9B2qblhqUt+zah2s+0d3eDTaHDlulhFHa8kMXm
 GoL8niM5aZtJwQ877vk3dM9aShQajuJwRru2U0mMt+y5FwFrWaRDWlyfcgwEwA0CN7zAxjh9uUf
 PN5Keb7DRMG48ZSyAL3oZ5PFYFVhJtH9MXAv8+BDHDrZu9dFooF7Q98kOJ5kDhowzzLpABG9SOj
 nj+43FhB4YG+s7fjFVX3F4Awt5YObGBPI74hKX6QoaKMSnmIlC2ePzdvP1nReBckDwnui0S6yKi
 75QTxxquIGItAqWZZbEGhaUfWzmZQV4r1gDiD0PRfYNF34DWsXQowgwB7LJtFE0I0nUaQpA==
X-Received: by 2002:a05:6000:1248:b0:439:a95b:3c44 with SMTP id
 ffacd0b85a97d-439a95b3e60mr10013508f8f.30.1772473917944; 
 Mon, 02 Mar 2026 09:51:57 -0800 (PST)
X-Received: by 2002:a05:6000:1248:b0:439:a95b:3c44 with SMTP id
 ffacd0b85a97d-439a95b3e60mr10013475f8f.30.1772473917460; 
 Mon, 02 Mar 2026 09:51:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c67sm30450502f8f.32.2026.03.02.09.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:51:57 -0800 (PST)
Message-ID: <11bf3187-7875-4894-9769-e2bd78fbd629@redhat.com>
Date: Mon, 2 Mar 2026 18:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 19/31] hw/arm/smmuv3: Fix CFGI_CD handling when stage-1
 is unsupported
To: Tao Tang <tangtao1634@phytium.com.cn>, Mostafa Saleh <smostafa@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
 <aaGu5v0To65M5LkB@google.com>
 <585be3ce-d5f3-455a-a7fb-3181920cfc60@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <585be3ce-d5f3-455a-a7fb-3181920cfc60@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zbAvROhEu880hdh4MZdfIIubeqglx8md-NP86hUM-h4_1772473918
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/1/26 1:33 PM, Tao Tang wrote:
>
> Hi Mostafa,
>
> On 2026/2/27 PM10:49, Mostafa Saleh wrote:
>> On Sat, Feb 21, 2026 at 06:17:33PM +0800, Tao Tang wrote:
>>> Add a STAGE1_SUPPORTED check in the CMD_CFGI_CD and CMD_CFGI_CD_ALL path
>>> and return CERROR_ILL when stage-1 translation is not implemented,
>>> matching the architecture requirement (IHI 0070G.b, page 176).
>>>
>>> Fixes: 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>> This is a separate fix, it can be sent standalone to make this series
>> smaller, similarly the first patch.
>
>
> For #1, #2 and #19 commit (this one), since I’m not fully sure about
> the expected process here, should I resend these already Reviewed-by
> fixes as standalone patch respectively right now,  and try to get them
> merged first?
>
>
>> Also the "Fixes" comment is not accurate, that was probably broken from
>> the stage-2 implementation which was added later.
>
>
> I'll remove "Fixes" when resending this commit.
>
Better to keep it after fixing it ;-)

Eric
>
>
>> Reviewed-by: Mostafa Saleh <smostafa@google.com>
>>
>> Thanks,
>> Mostafa
>
>
> Thanks for your review.
>
> Tao
>
>
>


