Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2875130lfy;
        Mon, 17 Aug 2020 06:22:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzN3NGGqZrERTqmc3EnV9lWzRToOJ4VZ1tdXp8r7MFV2Kc8g4Wm4WQbQUkMpGf5rU3GArP
X-Received: by 2002:a25:4252:: with SMTP id p79mr21617932yba.229.1597670524285;
        Mon, 17 Aug 2020 06:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597670524; cv=none;
        d=google.com; s=arc-20160816;
        b=yBsrM1Vjv+/5eVUsZv1blymCvpDnAKnCWAUfx26+iCbIYxpCajLQYsdT/cqzD123VQ
         zQtt1z3XI6W/GB0RfmWNfHXPSZpDQCUcgiau06bzh0WfZSyLone+IZoz0ggdpMTXHh3U
         JpFomI43v06nw8BRLey6tXMgFR9N/VO/aQuFHaeiklRsBA/lSSAjf/Z7f7MSoLQtcer6
         bEVTRPet/lSsuS+CMksS14r/TDMp9+Oe52C7xp8tcU6d0otr4IOfYxypFvrmhXyF8T8Q
         LIYJEWlpIuxIXQ3iOpcetF0xQIXDFDcquNNbOZ+wNhqOo2r5hiGHT1AJvUzrs4dwKuNh
         t2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:references
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=fZS8G6st3H2n4UB7hG0E04BVQEpTZ0ci3Cg9IiMAPGo=;
        b=UUjocNPa63NaXgXrxuy1pHa2sdAPGXmdaOA0v74XMpip/EPIh2r8bWupxXSzvOdOnU
         evJ5t1HzUzRksuF2nata4KC+xScvWxPBnU47OSBh3OCI9WVi5wwjYiicrZiM0LMFOQyD
         Omm9+ezSviolsY0b4lmFvw5hrgyUOWiyayurPQdTkiy2if2B5FydfUogWNdGr8W2iGUr
         LqeAJ8NduUVqgf1/RyPV0jxAgSeAZ3MR+M0D2m30MfFbXZwNt9ekk7n6xSr9JcuwCncW
         22xq17iigdRe4YnPD0ZXdP1cB1Z9SeHXyCYpPbHeZLzuTyq0nAWMoWD7t4IhgCw+u9jS
         +kcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=l3P90EvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si17595819ybv.175.2020.08.17.06.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 06:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=l3P90EvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7f5P-0005Hp-LY
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 09:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k7f5I-0005HI-JJ
 for qemu-arm@nongnu.org; Mon, 17 Aug 2020 09:21:56 -0400
Received: from sonic303-21.consmr.mail.ne1.yahoo.com ([66.163.188.147]:33928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k7f5E-0005G1-HG
 for qemu-arm@nongnu.org; Mon, 17 Aug 2020 09:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597670508; bh=fZS8G6st3H2n4UB7hG0E04BVQEpTZ0ci3Cg9IiMAPGo=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=l3P90EvQfAUbDY6QbK0BN4MfskKbgObREoC/olEultsGt4DQjC4K9eYivAeB1Rkp8B1pa/95bx3Og6nVPRwVpsWw/yTYZFPzj7j/WKC6sp18ZPOHIhkME5s8HHfNE+dLAonO5+4ynLpVZOy8oKUPp40a56BItV9OgwPVO0zHkmM1eb9+QHagXmqEZ163QjPEI6jDRh35HGLdPOS44a0ueIEnYLIw9T9YxsvJu9i3IC1vTOyXKnId5gNqnvTBTr0mM1WF+tYCQqyRDndDkK3ZWR42lBVslBG3AHkdldolfyH/Jst2XVuXBCpJRnwYdCGJfhNXK5TCf1Ka23W2H2xCPg==
X-YMail-OSG: n893Wj8VM1n73Diz4CpOFbiwNsafrEdTpHUA4nRBBEdIP2PjQks1xOKcbtHePy0
 Kcq_D4GVTY5k1cosbp_DxAya.MzN3o8W8ezwOqWkvrzM1gRbZe8F7xLf2NpHEKbAbMs3rEb22mZ3
 Z_IsU73lE7Q5ohCLryTvy1XJboDm_W_V.Oq5vlRPGf8TRgIOFlmURPcHGIhBuFR3QWK_drTEJolp
 gvBnem2mNaTnCL_V80WQhoxYsmlxs4qCRl_mxijxpIJJ3hI6WsLx1_9UBkwW1nh5pJHkK8shpxe.
 iV.o2qKmZHOlL1QNy8ukmIpJ02hdao6x8nwHYznr_N_JEsE0ztt4i3WkXbwaN9H8HdQ94dsXqfMC
 nwhJJLvWnCVEMlOyeYyX1WqIiOVzC2i.5Xs0WE5DDR4LdkpIyBst3HMezLHuLG6A_o1Hna8ZOJVk
 VKfSZDPi_ONL3sH6uU6NXvPBLH3th_.1ITh46vqLQP.ZHbfVYKgr.cg9QDI7IHTNLeOhRT4dh_Vl
 VGdAOxmouuJcP1sDzqU7Zeg1HXItmTA56q48IkqAMP4t2LfGxGfe41EECQOjrmWKmtzA55J7neju
 3iH6S1f3sFI.XsPbhMUMgss4JRe4c8aZ4VrCaG_wH11IIX60DwGsdLwd4TvFOcRyUnhqoU8Ks7UL
 mtqrJKbPpby3N9ZktSjJzV0bqTnuEcsGnyfuorY9g0okaiGJJegbN03n3TdURqKwxgMxUOT8kxFS
 jrGiBhwCsGMlm.dExQqYz9puWPUkN.xfqnrN.g3hmls6E7nhVUkcESpftO7.RkPcBIjLxaW6bxMW
 Oa1uYUE4CDF23657gNIrjzxhJovCpcRzmLktgF5AGaY_75_6wI8r62v_zE7h16ZZUaJ6JSfNjI94
 VtlS9cow4Iit.J.QA2PPNDiq4ffuHKDk3qUHGMJIfmJFSsHEOKkPGQIo8Tz41PmzlAl6JD8wfdrg
 w3ld6PdjIdLrx5vYS7hYUED39MvHLmYJQ4Ku5mxn4s7vZJ0Yqbsr9_OXCOeudZ5_I4HtZcXuxfNw
 sdATmwtOqLd2GzIv9u.Ju58M6C161Q1.F8Am5ICUFXix_X0N2WecSQDGDC5kkLBSZi.1cYZAg1yH
 lmBtQ1opVnDNq7PylcbqVKjJUJPlci7MvNtntUCEZfsv70O1USeEHJoAXnfUDNdZhsv4uIEohaEr
 0Sm2SQtpVZ45xh3hl72K.7stnlyzBqiSWeq7TbbQRbqyddo4IhwHo1eA_kgM6.7KAVpul7Ja2mr4
 KVqo7_BDgmZse05KrOC_lXqJaPJ5gOkFVztyw1Ehq_aDrnWSVhquxmNXB_tSf_nXeAG0aXBYCnFV
 4YTUqKSEhgmAWXQzQ9YZ9Rr1JyfjcUlSdA3kUfdx0acMY6JnEUaf_U.bncQ9Q3pwuDCqE9AS1LHg
 ncg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Mon, 17 Aug 2020 13:21:48 +0000
Date: Mon, 17 Aug 2020 13:21:47 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1995755327.3077884.1597670507808@mail.yahoo.com>
Subject: Arm Cortex M4 floating point
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3077883_92152407.1597670507807"
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=66.163.188.147;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic303-21.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 08:41:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkrXZmdOg+El

------=_Part_3077883_92152407.1597670507807
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Guys,
Currently trying to run some code that uses FPU instructions.Arm-CortexM4F core.
Using the stelaris board with M3 core, but param M4.
qemu-system-arm -M lm3s811evb -cpu cortex-m4 -m 8K-nographic -kernel notmain.bin
How can I use the FPU in QEMU?
Br, Mircea

------=_Part_3077883_92152407.1597670507807
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="yahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir="ltr" data-setdir="false">Hello Guys,</div><div dir="ltr" data-setdir="false"><br></div><div dir="ltr" data-setdir="false">Currently trying to run some code that uses FPU instructions.</div><div dir="ltr" data-setdir="false">Arm-CortexM4F core.</div><div dir="ltr" data-setdir="false"><br></div><div dir="ltr" data-setdir="false">Using the stelaris board with M3 core, but param M4.</div><div dir="ltr" data-setdir="false"><br></div><div dir="ltr" data-setdir="false"><span><div>qemu-system-arm -M lm3s811evb -cpu cortex-m4 -m 8K
-nographic -kernel notmain.bin</div><div><br></div><div dir="ltr" data-setdir="false">How can I use the FPU in QEMU?</div><div dir="ltr" data-setdir="false"><br></div><div dir="ltr" data-setdir="false">Br, Mircea</div></span><br></div></div></body></html>
------=_Part_3077883_92152407.1597670507807--
