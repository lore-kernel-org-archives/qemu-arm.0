Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DCEC5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 12:36:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxOTF-0003Xl-3B; Fri, 21 Aug 2026 08:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxOTD-0003XP-1N
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 08:35:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxOTA-00057w-Qj
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 08:35:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4813ea321cdso1427066f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787315734; x=1787920534; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IbJh2QSZ66GmvEyNk343YZCOFdbHwmsXMFl+nOfZwNk=;
 b=HfluvWxgqeYbWrmhBwTLCHqR4uy5XOw6CXS82Osiqp9KgTHbJys+iJUlGWPuRIEi4R
 e9/2i02iTH/CQCDq90G49VtRLndorIzzMIouhuzUSaLx28mQLzcEWjCqg0fZk3HOZzI7
 Wg3tFpwsCKrwX6a0ezC73KYhj0h00jk3C8FOYj5hReyGYKGpHE+dcvGlUWn3DP6YOG+K
 XllvSn/Rw9M+qKQ8SdBT8DP2bXjlfWoH1PNnUNBLhNdhvhsvSqXKXisMtjQPemwg9MqJ
 6XCbU23A3APdJ0bsMeqqd0p0pp9ZY2HfFJnTOZyN+/5A845UtKNulvpR/wwXMbsYIYgv
 VmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787315734; x=1787920534;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IbJh2QSZ66GmvEyNk343YZCOFdbHwmsXMFl+nOfZwNk=;
 b=ZsyxyPbtd2tljcVoXy7nB4zARBbJX2bvlYQU1oCRh1H/6g53Cd4gYOHZHNTtqh+NN4
 rQOrL3Tiy+N7aYKAXB1K8/Y4X6qP10lz6C8G10hf9MvxcRRQGAldwUbMkR+lDfDM07/6
 HXKbotebISsw05uSSC1lc8Ymv9QUFf0+iJNbzr72fZPmZs+b/EoMSDta/btjbqLwP3R4
 L9bn3RsGGp8Sg+X+eGdnvHV2DqJ4MjBMTTg1Kxqjkuxv3tiiwqgVcYb2vzJNuVm0u7Y6
 eI+GZpnnD6qXUh+o0iCAht6Tal8ABjPmVZhvng0v/uv1XV5uTQUMveey3tfnyOCIKz/7
 hb2w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp60puRuYaMU8lQOeI7pKZvd8M/K42dVkDqIpvlgyeHJgTZqypWir23pKVPTHmGB/alVow0jYlzSg==@nongnu.org
X-Gm-Message-State: AFuF++l1lS3VIp9YQjKdak+KeGu9sxtixiukGyBB7iTXZPzRTlwBUtNI
 w+S8UvQ4F3Zr4T4121VRMWkrzduWjHmVuhB1x8lpf4TqgONACeBcqBoqn/WZv1yfXQo=
X-Gm-Gg: AR+sD12R93PH7H4+15p6E6pwtb/8FvqSlejrxNGb5FtSB95wVf2A1pXpNXwDKSf8Q+q
 RGyplhPK6rponYlw6DsP3Wn8vSQFDG46iSvCBFzrdsbiko9Xi1Ns0/iTfKGGuxeTOI7+IkXK0Md
 Rb9Gzsb7CTlRuIp/UaW6kFmu4GcRUOPyxHXSpjs6S1fgzz8NAWQ1z4C2eXuwlPrNE855CoBYUd4
 tRT8wSoEKImjIVHbxsqGjxxx344ga86+YsPbChTCEzNVZYZyl/gFyxzSb6B0umpzwosz4pUp6z1
 mRjkMiH1KVYgn1kVF0JfAic71lFUFa7FO9U3ceqxAZEiX7JeRHPZAVugFHX0JjJylS1TkPogUj4
 ARde+U3n6jxiWAKRsoVmeVKgjeAr9qtMzDsuOGitw0S3T+3yG9Nv2FaBIXneLMHTIdnhj10MRVb
 TarilgwQtEV6xNytT0NpABoYvs92Y4YPhEPSQxXN5ciGuFA72fdDgy5YBhG7olRSQ=
X-Received: by 2002:a05:6000:250f:b0:47f:8cd3:4bed with SMTP id
 ffacd0b85a97d-482c104d89amr6864367f8f.5.1787315734335; 
 Fri, 21 Aug 2026 05:35:34 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:fa47:b339:78a1:d4c6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b80a5sm17559328f8f.24.2026.08.21.05.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 05:35:33 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:35:32 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 04/28] hw/arm/smmuv3: Track SEC_SID in configs and events
Message-ID: <aohGFNEatt53f0Bw@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162410.2805113-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162410.2805113-4-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42b.google.com
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

On Fri, Aug 14, 2026 at 12:24:09AM +0800, Tao Tang wrote:
> Pass the SEC_SID explicitly to smmuv3_decode_config() so configuration
> decoding can be tied to the correct register bank.
> 
> Plumb the SEC_SID through tracepoints and queue helpers so diagnostics
> and event logs always show which security interface emitted the record.
> To support this, the SEC_SID is placed in SMMUEventInfo so the bank is
> identified as soon as an event record is built.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3-accel.c    |  2 +-
>  hw/arm/smmuv3-internal.h |  3 ++-
>  hw/arm/smmuv3.c          | 26 +++++++++++++++-----------
>  hw/arm/trace-events      |  2 +-
>  include/hw/arm/smmuv3.h  |  1 +
>  5 files changed, 20 insertions(+), 14 deletions(-)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


