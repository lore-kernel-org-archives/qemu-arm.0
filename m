Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp100251lfu;
        Tue, 26 Apr 2022 02:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXuqU8cEF+5pgKMGaQHLrdGoQG10PzjXo4sIl2oW9d0YrhvTepAzEjGtk8d3UifhKk6J+X
X-Received: by 2002:a05:620a:44cb:b0:69f:35c:4280 with SMTP id y11-20020a05620a44cb00b0069f035c4280mr12746374qkp.216.1650967164588;
        Tue, 26 Apr 2022 02:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650967164; cv=none;
        d=google.com; s=arc-20160816;
        b=N4W6kfdWgCrpltr9nvVg97CjfgrJ2rygAfUOcfatJzNZ3QlnBOrex86omjuefufPfz
         AmkVWaUFmHYMPSO51FhmsSSYIkx6iRFk2OHTlkWlSGNjQWL7DVrIZ1dg+nsn8FqGaHos
         PmJLIo4AKEQSTuGqbrHPtH980H5FhElAH+nXZ8hPNhhpbsGSJ/hoRcqWqrjxUTSM2WuM
         byoWQ1fhW4kb+l8EkcVbQeAOLH1j/JLKWotOsKLAxPGmOXbGl/BJMzycOgyKwVpbu4ap
         17MGzt7F6j5u/pNbEVY5J5QWKrRByc4SegI3ikDPJzyAKgb+sLk57WQGOHiUUAKGIKW2
         fXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AcI+7vfqY6aiIhuUZjBSxvujZWoN83YBiCB4gXq3EdU=;
        b=riAhqW6nzQ/CBmNbdgsKzDWeAbBD71Ge9qTG4Ct6+KrhkCnT4E3jIkw6qkZwJR6ZAs
         la003ZjKg1YiVZd36UHiLCb4si/3dLpYEKM6V3eQm4tvFfiBDz8jj0AbY73TRsSdstKZ
         Y/terUa9ez7UWrDwj2J4nTakzB8Jts23eAzZbiJ67W5cT82zqlcllwSRPBq9LPxCKdoo
         UI6Ms3mF0sap/GOr+cRpaJUHPZKwFlE43g70h0e9oQM2bxvokVRxG9hN5MGOilhH0ECH
         36M8SBUKmUK42b9YRPYsZCrspKkZFvyl+1NdM2DOCaH9dcsTy1qhulNk2rtxjUryf+Gy
         Gd6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZC53A93m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn1-20020ad45de1000000b004467816b9c4si5059335qvb.0.2022.04.26.02.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 02:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZC53A93m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njHye-0006aA-1i
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHgP-0002DP-QR
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 05:40:34 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHgO-0007zo-2u
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 05:40:33 -0400
Received: by mail-yb1-xb33.google.com with SMTP id v59so18992928ybi.12
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcI+7vfqY6aiIhuUZjBSxvujZWoN83YBiCB4gXq3EdU=;
 b=ZC53A93m2cTM1XOlO1FK/reBcoE8OHThJEh8lV4NaCu4WBOs+U8Zz9KAwJMe6uA+YX
 8KQ77AA2pXCiK44vCf6C9wVIpL6Nqjx+GuFBek4lcUJl4hiEZ+7iRMCz3R9di0flliOI
 peO+zl8xkkGjTsWa66rgTwzW7q3ItTqGJoV0KqkX/UMookZw1hGmK1XC+IWaZ81e3BBH
 ixx3Eyp+8hevsRR6sBn0HY4gUzVN+lNtmbFlootzyZR0zH9BaI1J6K64cWLMEbxK/8Pi
 DSQBcnuJW2N8sBmoCCSQV5+t5g6LS0Dt9Ki+lirLp6/HcH+lHmY0v8IxNmk3+WDOimXf
 yY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcI+7vfqY6aiIhuUZjBSxvujZWoN83YBiCB4gXq3EdU=;
 b=qhNkwWkNKx+6asK+dbh1FKfPXXjRQE4kE/krzODSNv3s9urEVffh48dT2PTXfWLQc+
 qgtrlEaGN7rQJC3ekvTkDpnfWbSUTMXdJioLT0fsn1gTSSI6DGmnaqColeIYPIziPzxA
 Df/vn/svz3dFGIDXlMizL5ZlSKvmwH+VPKOXp38/NSylWVpbO/uY2zapvv2b7POzqQ5z
 ILPHmqQSb4MtjnJQ46vX++NYOfErUg9+LExuDHkOpkXPVBlsu94TNAZCEibimJAAVyvn
 kVhF2OSFRYIANQnwWf69NS6QwJqVkDltCqLUoVKXnqzEsodaLecwCsJx78C8OAO/OZj2
 s88g==
X-Gm-Message-State: AOAM5334iUoaXYcNswCeiGIRUAjtMwLntBxOfhh4/e0w1N/dGU9PripL
 VIMbtjZaA2Gf4kfDazapUG78j5ZgAghnpL5LsV3a2A==
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr10032517ybk.479.1650966030785; Tue, 26
 Apr 2022 02:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
 <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:40:19 +0100
Message-ID: <CAFEAcA_LcPozskR9y6WtMopWFY4tiL1UzJXSmVNPeZnyG=4ttA@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dRv0XFmdx2ji

On Fri, 22 Apr 2022 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> Just because
> the architecture usually defines that an _EL2 register is
> RES0 if EL2 is not present doesn't mean that it does so for
> every register or that it guarantees that it will continue
> to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
> don't have that statement in their documentation, which might or
> might not be an oversight.)

In those two cases, it probably is a documentation omission.

-- PMM
