Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AAECAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 10:39:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyT5q-0008JE-A3; Tue, 16 Sep 2025 06:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyT5p-0008In-LU
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 06:39:25 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyT5j-0002uy-Sw
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 06:39:25 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-724b9ba77d5so51503707b3.3
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758019158; x=1758623958; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLaIzXe1bxZ8S6CtmmJe0xzTfXrvlB/1Nfr+TRHNyb4=;
 b=i0Zs//F1zDXNemtqCZEVlLP+Ug9L8os2PdFOBMskpYWDeTZc3JN7EEGC3s/MUldGB3
 b2VJia5P+Tvs8AVD3aVlIKgKSgv3hQJmSVm/uP5Q2RmAz1sa/utzNgCFR2cjx85wZSIz
 vmK8mcIB5NFkSDIV25l792XHsSOS5ZDieylYgjWdlPXaDfuNBgI5WehD1bGaLODyMexF
 IozFf+xxmNRO+Pw3XZK+UB6IIsJ9pBfqLaxQK3J4RcgLdjKyhMtF0Fz9EnIq5EWyiufA
 Xy/WKNdixcqpfBweB2WeT4Vf1E6MgyGnhQK4uG8a/za8y2+9W7RXZEHM2gc2cG8Kv0FR
 HSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019158; x=1758623958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLaIzXe1bxZ8S6CtmmJe0xzTfXrvlB/1Nfr+TRHNyb4=;
 b=OuQWvpruaHfumZtWjxsE1o37rjyH9sv0I07ZVN3x5wubysJq6Ee2ASj9uVWqqP2Rfk
 qLIuDDlh6dx3HiJBQ5mvysJUzf0ZjMWVJETrD76qJSuFfzEL5yjl2g1dhAcwCBlUZ8cX
 qzeKIN5VMUDQ2mM7hFPj0mqxUD7V8oklDihCYMPzyaNNDuhn6/3nz9M6Y4pr1U5ud7fc
 iEWC97lJjBNqPcXGPuhoyqeJNP2eg1+T1EH1vtR+lLW+pu/rKEJ0wFeXDJKCkyDMWWE8
 UDR8ecLNeJykEsrtCIXkRVQr7N4pJ1r6KUa645ud6u/5nqCp8dz4Y5Mx8vX/gjFdpOfj
 OxKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKZuxQ/5TB8Hj5kG/sphgY84FiIwwNzV+KhjfjMEdO+InxROjVaz/TV9bcxboLjZChkwCWW+tXGg==@nongnu.org
X-Gm-Message-State: AOJu0YyMRz6rReTSWTF0ilsQTRoAn8fn6tdF711tnGIjMDbp0+Pj/gBY
 bCkZKgOWGpPuKt6e8dimeND7/Kur8PT+dcyoMdhu2xTOPZrvxq5d7RWudtDweuK5aiWHwoFNqKm
 dc27Dj9oU61EH0pNZpNMN1SNlZdhzQ4lixLF+PERXmw==
X-Gm-Gg: ASbGnctfFNnzh2x4+LKPjpxulOTsh3PWWU9UQaBtiG3ViPytLAhZ42l6P/rzZan5ndf
 VsWj/5Mq/5stTvNfbuQbF65y3x6cznhCN953mfK7qy8x0Q2wHrG+GyDI9i9oX7ACUJ7LI/1N8Kk
 1GSTnEnsvOkpsBYF4xzffletIAEnY06ADbSZYs3Sa3WWem4wWNMvbuC9QgDeaw5X5dnFRf48Ho/
 3igGH5b
X-Google-Smtp-Source: AGHT+IGkcIQTSI+IQr68/7DGnAiq4V9+g+UTCOWklrnnYNUed256xmme1A1t2wt90nmLp+Gzcqeg+OO3pSoOhgKgtI0=
X-Received: by 2002:a05:690e:4312:b0:633:a95e:ef08 with SMTP id
 956f58d0204a3-633a95ef4admr253040d50.5.1758019157457; Tue, 16 Sep 2025
 03:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
In-Reply-To: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Sep 2025 11:39:06 +0100
X-Gm-Features: Ac12FXzwq8fmDplrKX6_I2f5FjL4smUTsAUoUvWKQA57Q4jZFcqun4qUFOV3HC0
Message-ID: <CAFEAcA-xdREOLGyQkeeE1SxAH+27G9aepjD8jGoEJTbcLrm4+g@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] target/arm: Added support for SME register
 exposure to GDB
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, 9 Sept 2025 at 17:10, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> The QEMU GDB stub does not expose the ZA storage SME register to GDB via
> the remote serial protocol, which can be a useful functionality to debug SME
> code. To provide this functionality in Aarch64 target, this patch registers the
> SME register set with the GDB stub. To do so, this patch implements the
> aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
> specify how to get and set the SME registers, and the
> arm_gen_dynamic_smereg_feature() function to generate the target
> description in XML format to indicate the target architecture supports SME.
> Finally, this patch includes a dyn_smereg_feature structure to hold this
> GDB XML description of the SME registers for each CPU.
>
> Additionally, this patch series increases the value of MAX_PACKET_LENGTH
> to allow for remote GDB debugging of the ZA register when the vector
> length is maximal.
>
> We have chosen to drop the patch related to changing GDBState's line_buf
> to a dynamically re-sizeable GString for the time being.
>
> This patch also includes a test case for testing SME register exposure
> to GDB, based off of the existing SVE test case for the gdbstub.
>
> Vacha Bhavsar (3):
>   target/arm: Increase MAX_PACKET_LENGTH for SME ZA remote gdb debugging
>   target/arm: Added support for SME register exposure to GDB
>   target/arm: Added test case for SME register exposure to GDB

Thanks, I have applied this version to target-arm.next.

I had to fix up quite a few style nits reported by scripts/checkpatch.pl:
for future contributions I would suggest running your patches through
it. The script is not infallible so you have to use some judgement
in deciding whether to make changes, but it catches simple issues
like trailing whitespace or mixing tabs and spaces in indentation.

-- PMM

