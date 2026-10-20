Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7B606A319
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zAestnSu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ6q6-0008Si-Nq; Tue, 20 Oct 2026 06:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6q4-0008Rg-Kb
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:13:00 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6q2-0001ch-AO
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:13:00 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso23637207b3.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 03:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491177; cv=none;
 d=google.com; s=arc-20260327;
 b=prgrnCjBrTvDt3ujNP4Ac0RqTQ754H6A4sGiVkEcGP5CfEgHLgNvJMOCsI0PwnrVla
 6GvPTOMt0cJoTrPs2MQ3/MH+q0bbjZGKvtptd6xncpXOfeHRbAoZmV7GmBpoaVRs19wj
 5nnLsq3lw4SOp+8W/ASrlZ0OH7K++w7R4UvepN7BzIDye0tPOCMWRYJS+if49oMNacfK
 9/z6oxBxAjIoVBxLN//i6231q1c6N3qAdtuviko/1kUv3UsLqvEqIeTZ+3qu1QCRqXXF
 OS9dDGOr/64yF1BbW6ANn6NVGMZnJOEc2YDW5SCQrYEiGZCykfu3zZ5Mhrez240j9nPm
 /DOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pUCX5zCPpKMJHTf2oz5CuFqdtYBubbiFISxr1VT47x4=;
 fh=8HPbxTO5RDMBogXm3rUVcZXrQJBPePD66Mh4YI0ylko=;
 b=pJnHCRSMOikDsLwSs2T0QkWkjL0IoE7FzOqO9BSRn+s+kTPz1TVjilbVav22HhfxRC
 /cMFwvmu6xhU0PUNOSz2Xyv2BNAmfFS/tqjnNkPbltH8MRP4cTWiH6G2Ud9QmS1tGzqS
 DekACgzhNZUe52mOETeBNvura3YOflpaF8vS6mDuZHYPx+gWlv4TW2B3PCANMzRgnnbv
 rKFzAhb47AW40ZBNMoLfheU8mRR2XhKMRRjBDzFLJdydgIgKc8SgQ8t7f4X+ub4puB13
 8jaLtagQU72pu+aSpxSeJ2V+d8Vmd915qfOfitx1ZToDHv3UpOTBdBujNl/qb/F9H7uv
 ejhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792491177; x=1793095977; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pUCX5zCPpKMJHTf2oz5CuFqdtYBubbiFISxr1VT47x4=;
 b=zAestnSuQrXzdvi4hgl7mQ+CqDFbEt7ZsdshSe7rd4Y2EOSJwSVmdUf8ysLl2uWI2C
 zqYklEc4GBiMZYacz1b3Lj6SBWtOWdTWiDVqGhQUnSRXOntSeg1TXnRbuCF3sJeZS8Yn
 R85KYyG9X/R0OrarTzsekLufO1HqFUswaik7zX+X7nFeteNZZKDH1dEBSoEUoddovGy/
 Yx0jSoh8Ck8f/uF57iutN1e54jvkCAHs/WWe6BTq05YwYnYUjXBNmvmnfld2Zzuf/Jau
 pfvoq6bTJzpV9Fjwi+Vyda3omTd6pxCQuw9YaOLlqavlQhfKeZrjAkwcYwNsoZUqxsxc
 aOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792491177; x=1793095977;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pUCX5zCPpKMJHTf2oz5CuFqdtYBubbiFISxr1VT47x4=;
 b=yziRzLiLfHfhcTB0+oCUaECTmDmfzohaWx0aU7/UY5XB91fl7bfgxObY9rvKPrR7eL
 BTLmpjjyAahr5OJ2CQtVyz1AQyNvpuCoVEya6XWEveBDPCKHbJBvdU2/XjFbRqXULCAr
 2X+WlIIrvtVr9NFsQYd0dI+T63AI9anUghWVxB2p6GBRzClwLR3VEWQXQM1N1pEYrvpj
 /NddFBE/AxsscYQauqS79AfEsUK1TlZomM+o4Jj/EbIRyIS3NaF2/PH7WFkQfoFpG3uB
 bwq1M9L29x1HjOe3PwZb2U8DhT9IJH+Bwf2rsGCFxIy7u6csuDZIl8sreTGuJUcI6piz
 h7jw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMF9lyGV8OsFy7CA0ggIj6JYPlHj5xvAEH/SQdiTDPaaxmUCJTIzcAnOyf4F3KjNKtHNkEZuVxbQ==@nongnu.org
X-Gm-Message-State: AFq9FYLA5BiGZMXDBHPh6UJ8P9nSo+B1RCyb+CB8tGp12+I3fKRUN+1L
 W6ImcmkqQahk9XQkm+C3RkVGJPKuCXfUbexMvzbP24+Zs6b+xjeT2Aw+qrHM0A56t6+cZkoMyhH
 cq5+Y+PSw9BLSWEBpcG6/8h0EIFkg6hKNlOOYRuCYj3T/68/DtVVMigTS1g==
X-Gm-Gg: AYBFou1BMzc0aRfdRoOaBSscdMB13oSbyo/5akY4HcOMWnA71cL2lxMauLLCh0vwVlN
 v0Qi+atYVIEX/XvCtQsLwMmKUSJ7IjnduCzNjbh3r1J4kCEuaB7qa6cLLyCVbyEHeVeM7nXRze4
 +0mHfKh9UjxvDwt+eAyOGHwToDYGLNLFVSlFBJW+33NvxxZp4IPO75KHHcJZ0ZC6v2YrUCgfROJ
 TfXrwBXik1cncfc2LlSHIEv9aNUDHOMAC8jksSZE66jOCzEOyzmT3fOdzKYIOlBXomDTE+yTZ5Z
 sAw3txSYdziuTgHfJuvvYl5me4tHfsGrACsRx+5GcJHv75bkXlxwn9FjwN+NfRoxAIWdszt9Tma
 5pWUxoM1w0Y5Xx8vu9T0ILnJwnxOqRvwGdXnLmbhgjhigjBy/SQ==
X-Received: by 2002:a05:690c:c6cb:b0:89b:6ecb:c33a with SMTP id
 00721157ae682-8b11c7b7ad3mr5485507b3.60.1792491176610; Tue, 20 Oct 2026
 03:12:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020033755.2618640-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20261020033755.2618640-1-jamin_lin@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 11:12:44 +0100
X-Gm-Features: AclHuK9evmsUed6Z4ov0yT6gdM_4pxGAcgePE51_DqHNRdoC8b3IFzXVca7Z09I
Message-ID: <CAFEAcA_hYV_MzAD771i8MyX5NJozq=AuvT_v370udEqqa59O7A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/pci-host/aspeed_pcie: Fix global MSI setting during
 class initialization
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>, 
 "marcelomanzo@gmail.com" <marcelomanzo@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, 
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 04:38, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> The ASPEED PCIe class may be registered for machines that do not
> instantiate a PCIe root complex. Updating the global msi_nonbroken
> flag from class_init() therefore affects unrelated machines.
>
> Defer the update to the per-device realize handler, so the flag
> changes only when an ASPEED PCIe root complex is actually
> instantiated.
>
> Reported-by: Marcelo Manzo <marcelomanzo@gmail.com>
> Fixes: f002aa35f320 ("hw/pci-host/aspeed: Add AST2600 PCIe config space a=
nd host bridge")
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  hw/pci-host/aspeed_pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

As reminder for whoever picks this patch up, they should add
Cc: qemu-stable@nongnu.org

C=C3=A9dric, I assume you'll be taking this as an aspeed patch.

thanks
-- PMM

