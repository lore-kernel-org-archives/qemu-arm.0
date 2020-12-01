Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp310537lfb;
        Tue, 1 Dec 2020 08:24:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw48npNEUKnSiogL0pWinD5hu0aY9xerMFAe2sBqJbZ5jBp+g5581GzY1FjkfBJrpgEhtRP
X-Received: by 2002:a25:420b:: with SMTP id p11mr3760743yba.341.1606839861346;
        Tue, 01 Dec 2020 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606839861; cv=none;
        d=google.com; s=arc-20160816;
        b=SmzAN0zcBA1qjdG0jyN1fwl+P9w8nMT82uy02Y1BmBnFFZIM2LCxdlGAVPORv8QlWI
         ZOqKJ9fYs8z6RZn6lVSg+FAuqfTgEZnfnZ89TIodFSgdcioJfgGQLfWJ1tnOdpGEprzx
         R3qbtVYGzT9P1cgjH4tTSQSG9vMTDUBOIQUW3oAf7S9zJcKzZecn9WadNLHbFhu2REhw
         O3lvnuaUB2Y9CGN4JfXjM0wgNl2f6Ie1JKDSpl3tRMFJqhOxGSdT0c/u3TYT+W3MPxSW
         /ljkhBnppxR16/4bj3/x0NLleUENdh45o40c1utMIzq5VeOUHFUbvDoDYguOy8+mKgNz
         KpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QSqMzWL71wF/CYY1E2igpNgA7RW1EyKr4V4+aadc460=;
        b=SqdSt0JbS22w0Vo0R5qsrrMJSvmyJlcw/TW+roFFa/k+9fbF8m6hOaim9Dhg+ihTUW
         oGWXaU63hWvMA7BK7lJfLtFmUyT25cFV5lbEF8aEtoLq97wqq5wZdZaZRO2I4DbXfVx0
         RER09dXWJdzw5SoWWlM4K6R1WAUMJO27MaSihmlC3R8bUeD/NWJb0kuzup82a8XdZPrg
         2ncuKQxZv1PCKsyx+QIpOt6SqgrppOYH3nuLyaZqu0ZT1WNphKQUI/o0Awi5iatyydo0
         EsQimB9Ktgtd82tNIEBv8dPproEqt7YQpjtPqMU/0AmC5qA2xzBXnpUXNShOgJvNL5RW
         jZ0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiEt991l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si185861ybj.453.2020.12.01.08.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 08:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiEt991l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk8Rw-000719-Pj
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 11:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Rk-00070O-KS
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:24:08 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Rj-0001M8-4O
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:24:08 -0500
Received: by mail-oi1-x241.google.com with SMTP id t9so1212332oic.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QSqMzWL71wF/CYY1E2igpNgA7RW1EyKr4V4+aadc460=;
 b=GiEt991lTvnnikbx2O8sFfGQaHZswXM8HoTiKl+8xnQSoYyulNfcLSw8AALgG9X+oC
 i61kwCd+QKnurs1gvifz955jKolHBaC60kbChdQuclKGoit2ZJSZ25C9F3WpU2brUAU4
 vs50cHdFhUO/535ryI01PUYtl+qaTwEEu0NudNUNy5h0vaEIbH25kf5GPGSFzaS3DUD+
 +7cdgGfcaLo4xcxIHD7zwzvqFwCsnoL6+490s44R/+5tzVLqCaSrpq+vupPsJ99Pilx+
 YOa0U2zhLXI8/2Mk7ezIGgJVM8CJR3dXdm0XA0koHBVgxf/hZAefVwF14oWdVwf+3Zo8
 +EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSqMzWL71wF/CYY1E2igpNgA7RW1EyKr4V4+aadc460=;
 b=CNG/2/RcCGRb48kSrVHZE9ROy5m0Y02TlJL9eU1/MWQ33qZ30WOL47HcHpHsgg8ofl
 8SaPNYQzTNKGpJ7pPPSFcqF1sJPijpjgZVcl725CqlwaGmH6W+ae+jm6kQgdqKdUzdnv
 Uuh6Yv5SeiXvG75babnkA7qrCIfX/g8KVL6xc5ogBzq6/qkpgWtjL5SEMpfYxDTzi6xf
 XZgFI1i2DdaHyt8SzYLdgRA8KQBLHakrx0/LhzioaJbxyuHpb4dAhhgWV5EWu0degW6s
 hnQk352G9Gw/faE0ou9odUVjZWXNyJT21mfurxfdSjHMG5K+SuSxx4WaAGUHC78C4sJN
 4g/g==
X-Gm-Message-State: AOAM533VYCNgJdZ3oCP75RXo/VvGJ/8EQr69msUrMTRCCqss5wY65HsN
 ajlKUyxSQux3jmmena6VnW+ZBw==
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr2166640oia.149.1606839844979; 
 Tue, 01 Dec 2020 08:24:04 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q129sm485927oif.43.2020.12.01.08.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:24:03 -0800 (PST)
Subject: Re: [PATCH v2 28/28] target/arm: Implement Cortex-M55 model
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <131ade35-2194-9370-ebe3-ee12288bff78@linaro.org>
Date: Tue, 1 Dec 2020 10:24:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wTPrt9zdg3hn

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Now that we have implemented all the features needed by the v8.1M
> architecture, we can add the model of the Cortex-M55.  This is the
> configuration without MVE support; we'll add MVE later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
