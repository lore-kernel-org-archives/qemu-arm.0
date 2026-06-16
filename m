Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E99CD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVmk-0008FL-KT; Tue, 16 Jun 2026 11:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVmi-00087c-3U
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:33:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVmg-0004Et-HP
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:33:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c0c3543590so32801375ad.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623981; x=1782228781; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H2YyalrwFNEv7D034cKZG4YMW/b3G6Bqmn7fAphQxDs=;
 b=GP0NA2lMQ+Q90q5Pku6nVh2h/TIdlJFh+5x49fJRVQk30pWPYvMDo7mPsCz/225eYq
 4T8FRm5s3Ny6jtkuMefW4XDRxt2eG/tF3ffDT46LaGpks79tkXjflyWxsqKNu9+sV2JZ
 3Vd0Eks9HBIEAe8mhMIJxSJRBfqE61qRj5P5pRLfBFYH2GAw8hG6yTOHmLkf2xTI1LqV
 NrwDcK+IoQiD8NXVUVdMoPXrA/IAtoogA/71Dye9SfgV5kQZqRJskC7nnSg2AfmABjSS
 GvF0H894MfB6CUuKT2pERCKp7PWHAEVJ9xItexAsXEEeyJvkjzA+NUfNzWs7EoUYGEY+
 wX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623981; x=1782228781;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2YyalrwFNEv7D034cKZG4YMW/b3G6Bqmn7fAphQxDs=;
 b=YT6Ij/RkMO/NdZdtUJb/MdIArHfwH2RqPnY9qBgjMMAHQ8CDP53GXlZIiSlAMXcPUU
 JDXtXjNdLzGldVpxlvlqtjnkg7VP00CtDB6gWF9QUGJA/wy+k97goBBKY0s4SErR5+1J
 By9hkwPUZiuOtigYKP+CtPQMppBPV2AAqK3NKMVzRPpc9S/DSxwX/pJ96CFi0Myfykd5
 H/mlqfNsOXhF2I4ahPMmXTnRRyJMoPpuN9w4RavP697WOgMmWPVeukfe1qyt9KPxsWLV
 b/al2ysXm8bgPU9cVvaVSePKZfvJa+3DzE9Fa0ogUeE8lyjh5qmfbj3lyenWDeR1k/Li
 d0GQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mBmlHc2kQUYp4lfqXa5FeomoK5RFuHYdu1Q5XHU4WahGHNfzsiRDnE9qeBEDjTPpfnM4ZzeirpA==@nongnu.org
X-Gm-Message-State: AOJu0YzmrMqE9nroYCLqv50ZLfOZfKG4nr48e91GJwlMb1jLeWDwfH/d
 egaxx+N5cuyw364i7nWXpWweYnqdhEKvPSvHdzA9aFj6l2vCLS9iAG4uOdUkO/igIuS2cpjZSy+
 SzbgE
X-Gm-Gg: Acq92OHYvOEQoem+iDYYNd0W3Yo46yaDkvro++mrlEy3rtuABakFZWR7VNbdBtsrGYO
 EH2ZFqddCjjb0VLccqo5FIAiFpglBZEC9TQRY09sI7FLfT5+e++NwrrX/3V9vZHriN71KI/BcFA
 qqreDPFniQuULCLQpNomveMT1j1ZRmSPGCHTeGHZZ2q9/151eVm7193tiOi8ZlqWMSFljDL5NZn
 dA6+F29MPSeDkrRcoNhX9aC8L/gBISzQljcZOCVi81QHXEgWkPHXmpgXmVainAFgfB33q6gzIwF
 W+8xeYvojjSUmL6rLzhNNlJKkXsuMu3sdi/YjFOnULXLSiAHLhLpMonAjLxaItAVDKXdsGoVVZ4
 OpScOgxe5VQbmTcMktgEpTF46ICKL//zi+Z7ImE521wYACb6v4bmZ5AI/y/zyE/u72U/ZKNGJR7
 eUN4/2wP3InxiO0pahur2kEimjAbilxb6JJ+z3MQB+dF2C1Ssy8Q81jRDOVmXzRPmgpH1I
X-Received: by 2002:a17:902:ea07:b0:2be:22cc:e227 with SMTP id
 d9443c01a7336-2c69a0d455fmr38792325ad.4.1781623980779; 
 Tue, 16 Jun 2026 08:33:00 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4332694fdsm127026365ad.69.2026.06.16.08.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:33:00 -0700 (PDT)
Message-ID: <cea5b694-3f2a-432b-81c8-e44ad6fec70c@linaro.org>
Date: Tue, 16 Jun 2026 08:32:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/25] target/arm: Enable FEAT_SVE2p2 for -cpu max
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-24-richard.henderson@linaro.org>
 <CAFEAcA9zRtLb_judmNjvXSq_ZgASNyQZJMGmhcgaQ+p2RkcKKw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9zRtLb_judmNjvXSq_ZgASNyQZJMGmhcgaQ+p2RkcKKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 6/16/26 06:43, Peter Maydell wrote:
> On Fri, 5 Jun 2026 at 00:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/aarch64/elfload.c  | 1 +
>>   target/arm/tcg/cpu64.c        | 2 +-
>>   docs/system/arm/emulation.rst | 1 +
>>   3 files changed, 3 insertions(+), 1 deletion(-)
> 
> This is fine as a patch, so
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> but maybe we should hold off on enabling SVE2p2 for "max"
> until we have SME2p2 ? Architecturally if you have SVE2p2
> and SME then you're supposed to also have SME2p2.
> I know we usually don't worry about that kind of "feature X
> implies feature Y" when adding a new feature, trusting the
> guest to check separately for X and Y being present, but
> I feel like SVE/SME versions are particularly likely to be
> something guest software might make assumptions about here.

Fair enough.  I wondered about that myself.


r~

