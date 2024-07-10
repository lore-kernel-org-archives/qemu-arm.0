Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp404003njb;
        Wed, 10 Jul 2024 07:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1nQYNVcsQV84eecEllQ5et3sOhkAgtqY1iSV+87ijEScspA1g7jVHg698+Sr/DG/lD4ae8AzUpgWyWp2gJ/UPSaahaoET
X-Google-Smtp-Source: AGHT+IGEF/Z29EO3MKRae4iVZH9J4fDm9MaT9+z4WTDwJto/P3SlzHP1TUqj+Z8EP7BuZ6IAZTRV
X-Received: by 2002:a05:6830:388d:b0:707:1794:6f9c with SMTP id 46e09a7af769-70717947304mr238302a34.22.1720622250729;
        Wed, 10 Jul 2024 07:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720622250; cv=none;
        d=google.com; s=arc-20160816;
        b=kRf8J0CkvpjWOYJ84lH/QTLNzM9iirk7iXihAGTb6vHCGSuCLCsBOew0pYmUDD/MLk
         2cMqoacrS6/sR4/bdrSRexGK/UFDatGVyxcSJDBwlUIJlyI9n1jkT+LICGqH29I7TXKc
         7jwYNd68Ak1WGuusqAnHNWh2FsZB0RY/dx5KTP6zYDh3VSiq8I7iDOVLPJRBHhVfUQNX
         ZIrLHNOizqzSvrZkPEXiwIhcshpO6klb9jPgXbaCSDI9CRChROITDzjrVNwqSqX/+DBp
         ojQaLeu2b9/efEfoRWb++oWsZLuuoojGqKQOFQ2HLYWEfo/F/tgQezwG14WXN0mv0tpf
         hbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KPjBhqTMQQz+zEW5BDmFbWOo9n0F1MrwOUwA8+Jpr6g=;
        fh=yB9FEswA3ewAjH3qnM56O7r4GFI9DXSym8g5M3rqLVc=;
        b=qtI1w50gd39KRBcWA5C5sgK0ugseQF52NbGGwj74AGzroYuOYeA6hNs9R6htfBqlNs
         zQZJ++3vdHvL+6ZMoELGN4eV8SFtR/IsYB9DI7xsMpCbus769m7Gxu0+WGy1LHBb1uKd
         CWfmW237d1wmvE/sjn2I5iAZpRiLmzV/DD5dmzG3+TUEXg48THAIlrxsVV/UqYLn0yOl
         qTDX83KFH83/nZ35qMxV19NmN1LpUlMkV5TI81FOlidpLnhPebl7CuXvyurO3uAha3gd
         4gogOx5AvaTbF1ccDHqXGk0VLky7byJuU7ZMLkmz3rsuqDlRtcFALse9VmhkV7XgcO0N
         FEJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vze2vlo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f33dafcb63si735064e0c.224.2024.07.10.07.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:37:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vze2vlo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRYRS-0006aH-25; Wed, 10 Jul 2024 10:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRYRP-0006Qn-7h
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:37:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRYRM-0008Cm-BP
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:37:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2c8c6cc53c7so4488483a91.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720622222; x=1721227022; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KPjBhqTMQQz+zEW5BDmFbWOo9n0F1MrwOUwA8+Jpr6g=;
 b=vze2vlo9U+iTXnLH0w3Ici/vjKXoD1Nc+Io9Ci6z/zVmI4KkJD3+6TQ2j/ugr/xPbo
 /Qb8ROFl1DDt2QyLj0cl90KEHzn6fOF4ZRI6PFo7Nn5xNiSRl9UFYGwq4rpxfD5qOnEj
 gEXD5J+79gIbFsyoGkEAR2l5QMYekYXD7/Q2HR6gKJ57w0xr/qw2xTmek3SrUdO2Umiq
 +dxBRdktGdoBnKDAc7vzBcBkblzQeBTo7nLYzOLAbVzs0f55GpEVTwt0HZVcFuOxKjl8
 wsX5pd0/f6RutU9aFo9B7HZugVJ2Afqr01V+K1jgxuolrR0Q/nU+A5xAttg82tKmqWkY
 xQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720622222; x=1721227022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KPjBhqTMQQz+zEW5BDmFbWOo9n0F1MrwOUwA8+Jpr6g=;
 b=denChgVBSGqzayJmplRGzAduL6Mzs97buQGGMDyMhXjuBhxm4XVmtoq+13E3an4J3z
 8dJWgIsvWQR4C0hs7UC+2QzS0Nf51P771QWEsjOFNosayXe8S95tnvltOtQjjPemFE7s
 Y0drnm7ficLL0aYWiteQUZhc+IjdUVG7OYoVhlA7+KwaOuaq8VWBrghsSuc24dTDeGK7
 cK3GTIvo5ocVtcCTvgvgMgCY/dhYPaBldThEvkPMzwAkxVqEYViAqz2+urRnyP2sBX8Q
 /Lylum9c5wsX+pgxdBhcQ1YJ21vAmMv26YO5ZCSyQ5BQ3u+kEcu0bBaxNT9PpJhtjTBj
 Pwng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoRroLcdd60aF7ERq4vzwTuiybEqCQO+BU8LiDnxbQRVItRf2+smrOYqbFysMmsWAM6hKg4WCX9fS3789TfpRRuwDF
X-Gm-Message-State: AOJu0YzlNkVsoo282KXpU9Uhj/yu/J7Or2VVp8iOk7bWGntctYoxBva9
 Oe1NUX4nztpPk0ESFkIdPnAb1KG6V6R1/Gg9Hw0UI7rBCLvrbgPnvvqZY0whudU=
X-Received: by 2002:a17:90b:3a84:b0:2ca:7636:2214 with SMTP id
 98e67ed59e1d1-2ca763625e3mr1859187a91.4.1720622222226; 
 Wed, 10 Jul 2024 07:37:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99aabab9dsm11978185a91.57.2024.07.10.07.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:37:01 -0700 (PDT)
Message-ID: <7059ae89-1181-48ce-b828-0837f7a62c93@linaro.org>
Date: Wed, 10 Jul 2024 07:36:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] target/ppc: Hoist dcbz_size out of dcbz_common
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-7-richard.henderson@linaro.org>
 <aedda59d-2a8f-94bd-246d-d32ee6cf19be@eik.bme.hu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <aedda59d-2a8f-94bd-246d-d32ee6cf19be@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 6SvDjvLIftHT

On 7/10/24 05:11, BALATON Zoltan wrote:
> On Tue, 9 Jul 2024, Richard Henderson wrote:
>> The 970 logic does not apply to dcbzep, which is an e500 insn.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> As all callers pass GETPC() to retaddr maybe that could be moved into dcbz_common() as i 
> had in my patch.

No, that would be incorrect usage of GETPC.
It *must* be used in the HELPER directly called from TCG.


r~
