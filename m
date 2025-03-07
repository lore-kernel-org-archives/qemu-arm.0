Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2093632njm;
        Fri, 7 Mar 2025 03:00:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVs6JyJV3elfYymBFaCQctAraKBT77AStblb89RCfglhiuM0EgI4auVGYyqnB1ewVcj9Of0LkE74UClBA==@linaro.org
X-Google-Smtp-Source: AGHT+IHqrjjy/zFZrjqmKPY5AZ7mo597QD/PeGjaZ78NeDr/pkcs8l7w5ZMfNv+K1ct95q9KAW5L
X-Received: by 2002:a05:622a:4cb:b0:471:b0c0:82b0 with SMTP id d75a77b69052e-47610954c1emr35189491cf.4.1741345217047;
        Fri, 07 Mar 2025 03:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741345217; cv=none;
        d=google.com; s=arc-20240605;
        b=WATRncKa9r6LF9I52jHRK9PlMYjW+B/bUQElcD3oH4cffoHySh0K0dR6PN1Dnx7zCu
         q8gRKpuTUje4afsZ+Ijqcc3cpzSoNnHrgCeEuxHBuXVyryqL70cKQc4vicfkmXw6cZH0
         FlTySqNGSqGWhz1d1rxD4uCxBOQxjZv5CR93s0b6DAsoLViLVsR3jq3cfnZ6AFxwENNL
         2EojsyRSKgPOC3YViUDZ/qdmKtdzn3hNM7JIFtPB2ntevDHRJ1rfiNwF2Pf4AQywRp1S
         4+xEqrbjE0JCoL7I2Ey9e/AtAEls3f52MejybXyo2Q3sRZaaGMeSXWh+wVugtQ5e6syw
         itVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7RfL2K9/nW+zFcsaQ4NiQEoxg0Iv6ZXZQKdoDL2K2/U=;
        fh=hL0sl0p+xUDcB+jw/DfGj2WoseA8WdtBESDZ+7N5TsM=;
        b=k8XmtdKYyPDTlMVPP+vs/hA050u1Q2fWbv5TocSWscjzn9EhfsdkmqJyhqztxtJc4n
         HfrV5d/b/TY7w3VlDT6YoEOxqIQGPmgQjf4gXsJ6m1CCMYns49YdjxSjUUESZT88ENCG
         OsjWCY/oL9ec0NCl16hsVivwxtw2jW3T32pgQKlOf2l1WgV7IFeuIBBuzcp1IFbH65xJ
         fmXNQYSTgdGs2VJ0FIf9owJklskuLdN5XrdvMFGp4Avwc4YeOOf0FKRwXfdyr6H/Wj9P
         u9N03Uz9lj6zeub92qu+ouf94LyjSXGkNrDnan9fMv9GfckURXEnH3NJaOeiK5DFyBN9
         /DCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZENsdNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf8d6dsi31011741cf.204.2025.03.07.03.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 03:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZENsdNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqVR5-0000TM-4Y; Fri, 07 Mar 2025 06:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqVQq-0008Ti-D3
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 05:59:58 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqVQn-0006Zr-SC
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 05:59:55 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6efe4e3d698so16861197b3.0
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 02:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741345192; x=1741949992; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7RfL2K9/nW+zFcsaQ4NiQEoxg0Iv6ZXZQKdoDL2K2/U=;
 b=QZENsdNkoSZYpy/NnZaFzzEG96hFD/J1bfJm53J+TF3MBX7bS2EDZZcs/ULcJ3wkT3
 Ht02NSDHFqfSBmejCMTZJ/5UVxAB0Y1pICAuLQEI4Rq2akUYYm4vKr3HnI1qqqohbOKW
 ZWrDTfVBMXWk//Og+bytT66H4+TxIpVo2isRga7/bmoOc86yQYhZsr3S2NVYD1f8/Hc3
 FrdHCwMukzm4JNZKnjClefxDEf0Vr9QfYl9WeZsEwWVRyPgO1OkHl/hQn6H4+84d9Oli
 aX9wdZ0fSaca+gACHs5y7BIeZATmgQT3cSOJNybinpHHJoLeV7W2jQTr6mjWZLF2n6/Z
 GlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741345192; x=1741949992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7RfL2K9/nW+zFcsaQ4NiQEoxg0Iv6ZXZQKdoDL2K2/U=;
 b=RBGj2N4Vv4ZkpKQ2dc4rE60uUES8EWgVv60c4KuVqb34DaUzRcZzlDBwMDj50FSgkA
 KE7zkviBUPW0HpWKzc9B7D7cPUjVSs370R5bUNdQqWq6dP6id2QSVtq6myH+k/zrhZxk
 dhE74aG4SC3WGnyayIv/QdhQ0xlN6VIJE4dWKaxhVULoveMxCBxytlRUBmI1bzEjaqZj
 bVqYXXCxBRd8jo+E+vqBpsoqNExMKg19T0zwcGWomYtL9jeUfKrH7o5GHuZrdkM9d9sd
 FP9Y1ceSHRK/bzL+Zn+BLcLBY250tkkErdRZUIk4kWj51qdaFGJMlhIiaPTiLl/P82y7
 JQFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkTMkDS2hcnNtQ7YcV6cjAT1RiLJo4Kl9peHE5W+5ontddotJa5c6CvAxFUEpyS3RXnONoyt2gCA==@nongnu.org
X-Gm-Message-State: AOJu0YwqlMaKPn90UaDdxqwQJdCyAFs5TpKZsGKikHL+U0qYMeUBbO6z
 KBpLNm9b9tNywFOVfgpbwU10qUOhrE2gHxr0IrXjLo3faoN20zKHOqiX22s6bNvqzdxiRRMhvdk
 rGtLakz8zzlDc8IKVTwcuLRWu1HSGxtMmXI1tzx5MDTazNUKK
X-Gm-Gg: ASbGncueeKIb6n30yJIWEfr9PSauov6NXoE5kOw71PxWJUoDPMy765aL1xU76kixJNe
 ZVuYqb++btTrSCn0hOGLdMkE+oII+i999wxtYfuFft6CPDg2NLc2UrSzw6WjXErQFkQMjEc3hWq
 iVnFraCNgiIYpJ6eLjy0pwjRZgumw=
X-Received: by 2002:a05:690c:6f90:b0:6fd:4072:2c5b with SMTP id
 00721157ae682-6febf35f2b6mr41151787b3.24.1741345192726; Fri, 07 Mar 2025
 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20250228031438.3916-1-jansef.jian@hj-micro.com>
 <a55764ff-5e44-4057-af0f-3beb9ae1c0c1@redhat.com>
In-Reply-To: <a55764ff-5e44-4057-af0f-3beb9ae1c0c1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Mar 2025 10:59:41 +0000
X-Gm-Features: AQ5f1JqX8RLdcIBQShyNJFZbp6jUNVixVLdoaKCWBGDMJZlAIxjXT-WYKd7-mqY
Message-ID: <CAFEAcA8j2crjxpz0_ndf4fHCETRH5xa4wPdZpo6TdVW6CeZPxA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/smmu: Introduce smmu_configs_inv_sid_range()
 helper
To: eric.auger@redhat.com
Cc: JianChunfu <jansef.jian@hj-micro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: y3u1Y2auYC7o

On Wed, 5 Mar 2025 at 16:56, Eric Auger <eric.auger@redhat.com> wrote:
>
>
> Hi,
>
> On 2/28/25 4:14 AM, JianChunfu wrote:
> > Use a similar terminology smmu_hash_remove_by_sid_range() as the one
> > being used for other hash table matching functions since
> > smmuv3_invalidate_ste() name is not self explanatory, and introduce a
> > helper that invokes the g_hash_table_foreach_remove.
> >
> > No functional change intended.
> >
> > Signed-off-by: JianChunfu <jansef.jian@hj-micro.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>


Applied to target-arm.next, thanks.

-- PMM
