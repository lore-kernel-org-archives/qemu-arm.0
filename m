Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D97FCA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 22:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoUfp-0006wA-8V; Tue, 19 Aug 2025 18:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUfn-0006uf-CZ
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 18:19:19 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoUfl-0004si-5w
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 18:19:18 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b4743621044so1771207a12.0
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755641955; x=1756246755; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5hxrXAjf61iNW1Ll31DQuEb03MvcLYfvlT+/iSK8KA=;
 b=P1mi+VzZoskqqC75cMoLluC+eHenRsN6Q0S5GISQRaZ3YRiPZIctOfI5d/TUkcWZfj
 KHODlvR+v86Z6RQtWASvZ05f1ROlO66pUsrDFYDy8HYRov2VJAB/5WEhOXdUfV7h4Qv0
 drb9lbbSAK2v6C1TVZuE/iusOEBq+K4DChuhznfT318G+noKSNwSjGqsissPbIR9I/vS
 8zNe1ZKYdYrujaV4Cpg+L6TnBBQuwSJDznYT9tSoDmA07RUt+3ylllSDayBVkQA2i5WB
 Za30tsYH08YVDSbP9LotFHQB0tAwOKAuFpbJFaDtf+Tf7+atFiZAGEt/mQDrMnASaPkG
 bVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755641955; x=1756246755;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n5hxrXAjf61iNW1Ll31DQuEb03MvcLYfvlT+/iSK8KA=;
 b=Pd/SP0ONH8rGZw06jYFpzA27dcqC7/FtRUxraqvEL63KH9qGU0ka/oapL+VbyhcKSN
 kdf7kYfnGCWdVbNxn+0EbQZeQcDTX6a8MKAho7EeaY7cwPprB22QLxDvMn5gRLZ8Nomh
 DaeZ7KNNBPtYgGetxAjZGZqdP3aQMGDCdvB4gqYavtE8Oil2+19QuTv5alXClSWu5fgA
 xy7oMpDokX+6L1fsasXn8vucbVLk/mnjY0fxEzJg4j7FBKjOrJXdy7Z3+UvuNAM8iHCA
 nc/rJCZaVpkHW1/eLkiiYhnvxbOFIFgq2Mr4UX4P/I17G1guazXeDGeSd5ccaIwfRC54
 VwXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOb6JLu+CDkcwkJKo/3AA2u1KWtYSE6KlF4gRDFxz8U/vpo18zR2ys75daPUHGL6fZ+AoBLaGgbA==@nongnu.org
X-Gm-Message-State: AOJu0YwtULZ55BKMwRftdUVy6M+DIzb4vY+1QOeQXgP+R8Sxt+ZI9TuG
 gNh77HNcB/GvktEZrjUFw3/j7sNsop02qBzF738LN4cCcwW338psSSfv0tgYUPvwk9M=
X-Gm-Gg: ASbGncuMqBDg3ey5eetbOsgfj/C9v4jj4jRB1sSR6+1krLRjXsNVtrO0wBt5lqvZC2W
 c+7oyS22a/WTQJ2md4i4WviA3wJzFUYc0KmWMtQK2/AJMPKNxN6t7Y8B6g0eIoFvrHbZ4dFvyp1
 ZMEAa74gX9b23U+xw8YWMNudbwydSgbyrGo+EdCcXYtWA2RHgOpHf+3mXhAL4NCpzpGdGbk3u/w
 8RudMPc02I3MBB1Ykjn4zOJNCZxr+3uHX62MH8ELcKkiYqZHm3RmGNCutNGuBPSAOvmb6k5L/CP
 rw6cLopa1Ik0+3caMvlah/Lqs7Eo+r4ny+sKP8JjoyEfaRtF4qzigWwKs4xJt+Kfy2a0a0Cgum9
 Ogw6eYRSbc/LaAH9dtR5qdvL5ECUSr309Mg==
X-Google-Smtp-Source: AGHT+IEb8E1VqWUBJJgZFNZYPmcIhZjMlmLLtOvK9pLf8/m8D8vXmlH+qAFh+KFYh9lxoqwhbpkn9w==
X-Received: by 2002:a17:90b:51c1:b0:31e:beae:2934 with SMTP id
 98e67ed59e1d1-324e1423f88mr967743a91.18.1755641955176; 
 Tue, 19 Aug 2025 15:19:15 -0700 (PDT)
Received: from [10.0.0.90] ([120.159.20.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e258cb88sm211008a91.28.2025.08.19.15.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 15:19:14 -0700 (PDT)
Message-ID: <fa2566d9-0102-4de0-aa33-18154c623d56@linaro.org>
Date: Wed, 20 Aug 2025 08:19:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] tcg: Fork TCI for wasm backend
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1755623521.git.ktokunaga.mail@gmail.com>
 <630c91852939acf3c7fdd95c37b363fa5d4e60fd.1755623521.git.ktokunaga.mail@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <630c91852939acf3c7fdd95c37b363fa5d4e60fd.1755623521.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/20/25 04:21, Kohei Tokunaga wrote:
> The Wasm backend is implemented based on the forked TCI backend with
> utilizing the TCI interpreter to execute TBs.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

This is the wrong way to go about things.

Don't copy the tci backend and replace it piece by piece.
Start with a clean slate and add the pieces one at a time.


r~

