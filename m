Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1241179lfy;
        Sat, 22 Aug 2020 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpV/XrVBdB8xONTdgzxFogCPI5Sc+FUG0o/YHPDFf5/vyuH/EgVJ1Y1xIhK9vSmiMKCT+R
X-Received: by 2002:a25:60d5:: with SMTP id u204mr10356193ybb.44.1598113129433;
        Sat, 22 Aug 2020 09:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598113129; cv=none;
        d=google.com; s=arc-20160816;
        b=X4KZ4lMDmTCB1dyZn8AKbNiWyADEbWcqViFqU8ELRo1aMNPNxLWu1VRbDJ2K7XHXHR
         W3NGRUHZTWiJEG8LZq/gaA8AR4/qfr956ZngtpjOrLiorpVfRRLATF/LmcrUVOc4AaEY
         f8FOGk+6PZJNC8lVw19UUQg55INAGQiSryN3ZBHhBw5o/ArVmkn8IjywKZO+uDd+kqc5
         VlVSvpHR1R4YM8HbycFOwi4PAlGE+ShZcTGxt1sCBzilh2EAvB2VUP6zDVh7lgv4oVYH
         9NJmHRgbFO1WyqrEhp2yGUcVOmXv+K3tQA/M/nN7L96k5IW+fzf7gW2B59+WVrl9nRcr
         AKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hPwRXW4zmqimsF1rXbRonw/TPwj2MgH5J0yduwvBAWs=;
        b=pGcazJ6h07dPp/Sg7FZqlmT0g2miz3ZT9riKiPIxIlQvA4Yl4lDUUmkhxbLDwGb+aD
         tw7zwaMaPA6Xum5pKgntDMTD5PN72GYUieuG4RIqtt3g7TyydsWXsyGdb8XjiLkkpW4e
         xV0rxnWEHE+7iQ00tme60tO2mbjvovXz/PhnJIlPRe3PRARJaUsTkjM3r1/xLeoCiWLq
         AY/hLQpFaXn8hvNmH7pWsmyvan6Se3fiMO6EluqOoHSpteGeZ/QGBD4bVkJZcfobbN07
         oKCg9OYu6TrPrATGFC6GTTw+U9ho67xxlpKspYpdGTNFU6GsdAXyd0+u9xWS+iANqj43
         sjHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jNqzEfrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si6056888ybe.153.2020.08.22.09.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Aug 2020 09:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jNqzEfrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9WEC-0002Jq-Rt
	for alex.bennee@linaro.org; Sat, 22 Aug 2020 12:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9WE5-0002F3-4x
 for qemu-arm@nongnu.org; Sat, 22 Aug 2020 12:18:41 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9WE1-0001jz-Q3
 for qemu-arm@nongnu.org; Sat, 22 Aug 2020 12:18:40 -0400
Received: by mail-ed1-x541.google.com with SMTP id f24so1847751edw.10
 for <qemu-arm@nongnu.org>; Sat, 22 Aug 2020 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hPwRXW4zmqimsF1rXbRonw/TPwj2MgH5J0yduwvBAWs=;
 b=jNqzEfrN6544f+QuHJDKmooTLKhyMU+jjwvoawSQLmzW+tVN+G9Tqy2jca6SmZMWNy
 PjNLx3pnAv/8CJsb8+Dj9ylTrRrcrFIBB1rSaoDJXogsoJARUEqUfMI3v1kkcA4PZnMZ
 LglfLf+6jWuBlqenwbZPS2ujjj+6m22SBBN92eDe4ox5befDBZeU4hqjX5cD7OVm5JU6
 kHppHxLtH3Y4ZlViCibOllPVpLHeNjSwAvod24/UUc7HZmwB6+DNYdGm2nTkZmViLIdc
 35eu+IN0qRxC87MEpFxNZs7SMhqduRk/8YixlGoxM5jzH8u7GNOOFRRFoIe/CQV2jTsh
 vCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hPwRXW4zmqimsF1rXbRonw/TPwj2MgH5J0yduwvBAWs=;
 b=e2fVkRoPVdNC3ZoeNkLEimUPETsEgckFFb1hC6Yuw22PGUZFzWOCZEyolgFqwr1vcg
 gMgdt+LfAPrHSXS7VBrjErPaeosLMLGGFeHH2V2Kkzj7VfEATsXazP2eqRW7xGbbos7n
 ZbqgbeUhaKhbUCKVKX4utDK7+yMbVSqksZtbaqbG22JnZ5ikAKScrxCYbP+xmIKuR/Az
 NWDnvLkfkpZdK32CBWbkar2Wo0VOOoiYyB7RWs3cpgIQsu4Bij7Y3NSI/ZIzAKjoHSIU
 iCiDyJl7sFMxbGpybilOE07zdypN5hU9xt7CEknYqRKhYdBWrjRWCRK+CY1D5V4RQLMO
 eKZA==
X-Gm-Message-State: AOAM53243NTQ3f8lrBT8dJ8rpncXCDFKpk19x7xEYVhzguL9ll6e1NLa
 4RjVS8QTRGtpfm3l7pmNqmx7z2d46/ikfc7ZObBr6w==
X-Received: by 2002:aa7:c594:: with SMTP id g20mr7635626edq.146.1598113116248; 
 Sat, 22 Aug 2020 09:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200822150457.1322519-1-f4bug@amsat.org>
In-Reply-To: <20200822150457.1322519-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Aug 2020 17:18:25 +0100
Message-ID: <CAFEAcA_VexUZ70aL+6ecf2MNoFCVtRfPOUJf2Z8DQJqPDJbAKA@mail.gmail.com>
Subject: Re: [PATCH] util/hexdump: Convert to take a void pointer argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Zhang Chen <chen.zhang@intel.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLIyMg1uYXXs

On Sat, 22 Aug 2020 at 16:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Most uses of qemu_hexdump() do not take an array of char
> as input, forcing use of cast. Since we can use this
> helper to dump any kind of buffer, use a pointer to void
> argument instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t =
size);
> +void qemu_hexdump(const void *ptr, FILE *fp, const char *prefix, size_t =
size);

Changing the type seems reasonable, but it is still a pointer
to a buffer, so I think keeping the name 'buf' is more descriptive.

As an aside, is it just me that finds the order of arguments
here a bit odd? The pointer to the buffer and the length of
the buffer are closely related arguments that are widely
separated in the argument list order, and the FILE* that
you might expect to come first doesn't. "fp, prefix, buf, size"
would seem more logical. Not sure it's worth the effort of
changing, though...

thanks
-- PMM
