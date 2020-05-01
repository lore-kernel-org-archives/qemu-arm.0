Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp214481lfm;
        Thu, 30 Apr 2020 21:13:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypLzudT9XF/FS7dUmt1VOOdUCZPSIBifwYbdofL05lcJQAanVsRGhJT+PUHeXk900ELcqnzT
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr2220514qvt.170.1588306415109;
        Thu, 30 Apr 2020 21:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588306415; cv=none;
        d=google.com; s=arc-20160816;
        b=FPgdwcYyllrINJ6anqAXTWiLgcmGtwyjnubjxcoVNB10jGSGKzUIGmyLcaJ9LNCW5p
         6X5nWDjXScHpfz3rBKnG++Jh+x5uBlSux6JcpEz1NrgZrHB1ZG3oX77GFESusnY14Yd6
         ecufqV3kikgIdPyoTR3utIcRt9FTOHi2slM8PBXwFewI35SbmLMGDzq8taCGKsRhMyOW
         BN4rycYbRpPgIZPrNjeYDSvhuZSzZtpH6i60QTIMSf2UjIp9UmGEPvU0Cu+WLfeIPH2C
         6ashs30OSbJ20kXOPNfQ6RAyBdPbgYG3O6WUnPlS7FCAN8fiXWYHUvXYH0IvNkPtmp4B
         s5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NHSmdMDC/Sy24mN5oHrLE1OujPQ2Z8sWGmcyLx2TPDo=;
        b=rqxiPj4ldFGZLSORCg/fQiHg6GXGrNiuToArG+vQh74zJlgZawxyyBX2+E6qc78yzU
         w0tIyWORYkiZ63khz9gj85NT/SsqSDKKwQooTF6zPg5TR84EgWF/3KWdL8ksAuL4+fi+
         1IASumytq4SfM3nN2v5nUApXOfjjvDDgm0TqGsdAwpl44bHWonOI5CzVR+ehrEtoLPQ2
         VrMIRxrjXZUSLoeqYRBSiHkBpKrIuMolYTk6HDxYUTjNx/ujrqiHK0TxPxm0mYDgoRFg
         DaXfVIgIEJh0aDShJ2wGJxRsTXQ2g2n0Q4d/Y0iapdv9+L0iq45poolpLejxN0eBpbN7
         xLgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Euz3L1cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id u6si1104280qvo.153.2020.04.30.21.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 21:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Euz3L1cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUN3O-000265-IF
	for alex.bennee@linaro.org; Fri, 01 May 2020 00:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUN3H-00025m-KE
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUN3G-0005d8-UA
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:13:27 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUN3G-0005a8-Em
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:13:26 -0400
Received: by mail-pg1-x544.google.com with SMTP id l12so1196957pgr.10
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 21:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NHSmdMDC/Sy24mN5oHrLE1OujPQ2Z8sWGmcyLx2TPDo=;
 b=Euz3L1cdEEmL5uTHrhXJZnfsu+ZJld0pdcncpdYY1+QdwJ/Jb5oI2M+l+qXPhRl1ba
 a5OhPrpkIIagtI3m9smZ2Z6Tq9OS6yuk2H+U++qgE5yhqlURZ9ej2OaJifKvLXwcgbcK
 Vcwz6QdPyJS/Px6wsIko7o0PZ0+94GhP/JNx2XphvqUm9gxe+XgKZBqIsMC2MPojFdxD
 eyqQQp/QNSuE25aYNqp26nWZYomFoUQBUPtyAtkVyLHphyZWD2SUAtaHJffHq0NkSOYm
 jP8lWn8wknZ4RO33cbqA+OotV7rkCBSOrX3fGxW3bNliCn1vfs26Ep3+EI+7NxJyo7me
 HJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHSmdMDC/Sy24mN5oHrLE1OujPQ2Z8sWGmcyLx2TPDo=;
 b=O5ZU7+U52y0IbdsDZ5y81oc/f6XcVhU7XVhyv5VlVxCaNJCH/XuqcBVjcA7HNPQULw
 bZjUDH6bsLX2bpJL3TRBmVTc87aLkAgkpna2JVq10qhMDxAccFSS39lcWpGjo8F2yhAj
 Bkoq9OrF1EdggI6SOxL+fVXFRaBC/2aaFwX2h1rqbjYFRmBAmwv+E1vueaiRuJ715IgV
 /MgWDKRX/trXu7VPHqSlw3ERcrqTk+cA/pn3fqhmRVpgwhEMnsA8Z+3EgTzDoaMtcRFZ
 WrteRvrU+C7oAiP8hv6lR17ApjR+napIPsv0ts/O0Sc7EPG94ZHAxENQLB+se4qBOvxi
 9Xlg==
X-Gm-Message-State: AGi0PubJxbDraIcJIjeWvqEkRQy/uO4McZoBU0//5f6j9FBojGOfhl9s
 0HazpLZapxTwza1raWVVWnq3SA==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr2230445pfq.31.1588306405034; 
 Thu, 30 Apr 2020 21:13:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id e135sm1080723pfh.37.2020.04.30.21.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 21:13:24 -0700 (PDT)
Subject: Re: [PATCH 35/36] target/arm: Convert Neon fp
 VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a57ff88f-57d2-9bf2-0cbf-1839003a3783@linaro.org>
Date: Thu, 30 Apr 2020 21:13:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: ZWuE83D9/SER

On 4/30/20 11:10 AM, Peter Maydell wrote:
> Convert the Neon fp VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS 3-reg-same
> insns to decodetree. (These are all the remaining non-accumulation
> instructions in this group.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 60 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 42 ++---------------------
>  target/arm/neon-dp.decode       |  6 ++++
>  3 files changed, 68 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
