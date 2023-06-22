Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp442447ejb;
        Thu, 22 Jun 2023 05:46:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OUgm5G2mqoNtGExshBglGEyqiZLoIWlgQqmcWbXJ9ZZRKI1fo9Y968nfyyhn7bWALSdm4
X-Received: by 2002:a1f:da45:0:b0:471:1b41:dbb2 with SMTP id r66-20020a1fda45000000b004711b41dbb2mr9008139vkg.10.1687437999019;
        Thu, 22 Jun 2023 05:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687437998; cv=none;
        d=google.com; s=arc-20160816;
        b=hqY2AUpmx6lFnEtdI7SVQCv1qSSoNZQTXtS0ThOpWolY9aoxUUJDOfxcofpPSqfZYr
         32fN4Cte0ijqXop7xCsjxwgtzXj1kAChnLSXRlsJOshvO+6hliKyER+QWkHiHGIrHYxo
         bbrLJ78VNGdnzi476y+5V88y0gMR0qQQAsoO2uCSWyf10we2xMeRZcLyLCSPeIri8GG8
         wGltRsLAhLRKqE2inaC4L5bS7D+MB7N15LBEaupHmh/yoDT0Kx+c3girAcrllVAyjod3
         QL6n2jKXrTH1zvmUbEXOrc0C/rID/bA+CX9HXfhh7VE+8mqVFEpIkKWTNocZYFL638g5
         XjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lEwB5Qxt8Jc5L249b/yUgqX817SyHViHn0bdjo0QeWg=;
        b=bvmHvlkF0SvhtqImlz+w5Q3KNvgubjeRq7uFQs6JPyUJLKrzTKipdQn55HH7ibSVDc
         FmvLBMV+BmW+2+5BKPjls1wz5QXCmHBwnaN/w8maVx1DCj7okHycshojVtIUSRR0GMok
         sAcgvpAQipo9H+DF4I5wtYPBlkdu8MA4R4i3mTPR7JvNA/xQ6D2NrCj5Z0VQfulP3uiP
         3KmNffU8uNaAAw9yCYeeRVk5KfkFFXaV9PFy//BIiKtpCbR33EM6miyhsU4aU1Tr0WWo
         h2N84eUkKmVhWSkeQs0XX2XVZjiVzZ8BddqJpMonCyLXsl4jlxlo7k9lom6Jf82TuXsP
         RqwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsDcVeGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh4-20020a05621429c400b006260a235e81si2653887qvb.123.2023.06.22.05.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 05:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsDcVeGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCJhK-0002vW-OY; Thu, 22 Jun 2023 08:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCJhI-0002uh-J1
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 08:46:00 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCJhG-0001qF-Tj
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 08:46:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51bde6a8c20so1826269a12.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687437957; x=1690029957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lEwB5Qxt8Jc5L249b/yUgqX817SyHViHn0bdjo0QeWg=;
 b=AsDcVeGXBacQDyXpQH2EvVp+cQ0BrxNHct3BJ9sRkOErLiBsk382bwcqV2vQdqzUTW
 iAKbEzLHl7K8JD9GfHydcqeZTlGVFUJhp2pbxmO4dybteryMIdOIOUmEo5u43MXpGVMz
 Y6ssut/3VOW+INHvCXV1zCLNJH25NPb7HUPXmrWhDhOF9uwRlfZO+goQLQ9om7xon2vc
 B7mBpBabhK2DSkXRSAtOYWqmeTofauK1cvDpjp22QDEiUx0O3vqJp9krITp9+80r1ybp
 5RcmKMbmqDzGchTIAmRVN0YewhnI4rhW5TfgmFTAbHbLWCnwvZV6GQ0xzepIaxLO36vz
 bK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687437957; x=1690029957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lEwB5Qxt8Jc5L249b/yUgqX817SyHViHn0bdjo0QeWg=;
 b=QYWcIDOa7eGslYm8+WR/EOCRouDvjypl2eoWqvQH3wGPvUCd4EGXckpo8QrCmqzBR8
 geznKAjTVn3Juzv1AfrPM1bczgtYPxSNz5sBMAYdxm2mwR0fZTIId+Ao6DrAXc6DhjTm
 Ro73q2zRgcvQlsb8VEo9tvmuYgUWnrVdrkBrxydINOdZr8DuMgoTnIVNfalO7mzF/OMA
 6Uk740FIos9Ad3ftJ7gZrhk3sy9nsMihQG0N9Wjd3HB8vjm4xIYQthmIpy22emZlCkYb
 hRoJjc5Yx7jyVnhbr8CizJIhLdTma/BIeEenpC2UxNJ6eBbp+pV8YBbCHfRLw0D/sb14
 Clug==
X-Gm-Message-State: AC+VfDykUZcordZQrWPlyn/Ftv9hSlIzb5InsdyTsNit/c03FZGxgoI8
 VWruro96izAhgwcxzX8WQ9fUwxFRoH2rd7gpF8DM0Q==
X-Received: by 2002:a50:fc07:0:b0:51a:60be:7d5a with SMTP id
 i7-20020a50fc07000000b0051a60be7d5amr6526257edr.14.1687437956785; Thu, 22 Jun
 2023 05:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124418.805717-1-richard.henderson@linaro.org>
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2023 13:45:45 +0100
Message-ID: <CAFEAcA_mRP1=TrtF4dk12owguHTSCBKmjkMXfCb9YYFcOqqCPw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] target/arm: Implement FEAT_RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /wl+Zfc4OnFb

On Tue, 20 Jun 2023 at 13:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Enabled only by cpu property x-rme=on, not -cpu max.
>   * Rebase vs SecEL2 fixes, now in master.
>
> This doesn't have the magic RMM memory, which previous patch sets
> included for booting Huawei's forked TF-A.  Upstream TF-A does not
> have sufficient code to build either PLAT={qemu,qemu_sbsa} with
> the RMM enabled, so that can't be tested either at the moment.
>
> All I can say is that this doesn't appear to break anything else
> with x-rme=on.  Which is less than satisfying.

I'm going to apply this to target-arm.next, since it's all
reviewed. I've added this to the patch 20 commit message:

# We're not currently completely sure whether FEAT_RME will
# be OK to enable purely as a CPU-level property, or if it will
# need board co-operation, so we're making these experimental
# x- properties, so that the people developing the system
# level software for RME can try to start using this and let
# us know how it goes. The command line syntax for enabling
# this will change in future, without backwards-compatibility.

If you can send an extra patch that does the documentation
changes that would be great; I figured we didn't need to
hold this up or apply only 1-19 and not 20 just for the
docs update.

thanks
-- PMM
