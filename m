Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3473602lfg;
        Mon, 29 Mar 2021 01:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMrtGWr8G1rDI92D5/gob56FKC/oxtF4Zdzis7K5087Xs2ITzrDZqVFoSWJVBAcCdQXyeH
X-Received: by 2002:a25:ae9f:: with SMTP id b31mr36852023ybj.160.1617007190849;
        Mon, 29 Mar 2021 01:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617007190; cv=none;
        d=google.com; s=arc-20160816;
        b=c2jauwN6NDBj7nzPzDmsCFC597XvJ2Lqg8ZMXGorbHxUxc7alf2opdNYwHPJyCqg9i
         jgwRLHxThHNyj3NSpj13/c/p1uQNZhtIUhXZRA3hpuuORJHU7OQO+YRwA5yw2U6hFuXq
         v7ozffniFbSmiQBhNt+6+QVMvMPJkbCr+pHLsQiGzwDQFe7jRAqtFHfuqtDGKhRVqo2H
         ZuGeBvsXztd/cNfCDDvSRTQeDhhX4LYTVEXTLfNLOjAT0MCTwqp/9N7HEXX6JRp74I9V
         ysQTDMZlAz08c42No50ZStBzDDVDcVXcpv/aU0/QKfAw0h9QhW2lKSR4Z1sK3v8I3rB4
         rVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:mime-version
         :importance:to:from:message-id:subject:date:dkim-signature;
        bh=OLR/fC0NggBW50FcktlFKVdIAStkAIzUisW2FLHI+1E=;
        b=Iv4GoFaHqg/e0UnqFIYwz3wkHttH0XvPf/aL44mErSNESU3uQHgenIA619Zk6zZ9x4
         VZbo0cBVET2Ft3l7H8RRMQAnKNU850FmgcGM7pY47Yt+/ehLEneDxukaCZwe1pM81ouP
         pzYPReZMJvQQsPJOfSodRuV7Ar/Fhcb4yqYxuQxMqO9UeMTfidL9lZWdRc+JCNIqyVrS
         IYL3q7l8ATZMZljUxNCvSiXt+BsLZY0RteenuWL53MZ5/15WbRJIADGgWfZTAY2E7Rzf
         Fg1uyZz6eGZwVoPvJ07dr+eeumRPNhI4RX/YFY5cTAwWQIQhFVH2MCDs0hQ6JfWn0vHf
         GUpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com.hk header.s=s2048 header.b=mia7TaeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com.hk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x32si8419053ybd.397.2021.03.29.01.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 01:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com.hk header.s=s2048 header.b=mia7TaeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com.hk
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQnR8-0004PZ-6k
	for alex.bennee@linaro.org; Mon, 29 Mar 2021 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkt_1@yahoo.com.hk>)
 id 1lQmBp-0007Wx-Hp
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 03:19:57 -0400
Received: from sonic314-21.consmr.mail.sg3.yahoo.com ([106.10.240.145]:43793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkt_1@yahoo.com.hk>)
 id 1lQmBm-0006I5-On
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 03:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.hk; s=s2048;
 t=1617002386; bh=OLR/fC0NggBW50FcktlFKVdIAStkAIzUisW2FLHI+1E=;
 h=Date:Subject:From:To:References:From:Subject:Reply-To;
 b=mia7TaeCmqnxEQYnu1lMB7MNB3Y+QfeWXwD0HtLcwrC0bNG+4PBZKV+okac2BMfYkqaEf8fXNni+3a2V25LFkE4h2Yl3o+eR58sb7Gk1fPaV+V2SieeygdGxtJUj29XFV2kakvhjBUXAShVpy94uiK31OHSq3mwYluOPDcJKgCs8XpaYGdH+RFLKE7RtwnrTTouMSNr94qD1wh/UwqvyBxNBZof84HUbF28RQrzID5HmST4hCxP1c2cowdWXxyBmmDufTlsi5Mmy55TUq8IbzTqIlr5j8zLRcOM9bmdGeM6xXI02niOzkaTebikgBNttQBQG8g4ZYG2C64p5pqx35Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1617002386; bh=PwSREJb9nkfajwIDLppNIVLhBZ/rMAz/suBrPKxu7GS=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=mCqkp/kLPEfe0GrIMkbIW7nhhLyawjTciSCa7ndzx6Ha/yw/2E3j6ke97nbhACoELe7hbgKLtjpulJB7KFZSDReiqkarb4X/D87nH454eQabs42XZ2MncoDlOsLjW5oU04vmLgBo7p1fibB5dubKZ8Hn+JBLkBx6l4hww7rpp2ZN7FImxIncePa+cFCFomRAESfWNuci40si8Vc/xz5jpk/S38mfYreMaO2izMjxIxsV4pLP1Q9KDRCyd5fnOC70cAgs6AQKNy35m60x3t8+hKi3k/YkQkH3yXvR4xZ1yVjAxVzIkZNGLpu3e5RKNmwa/FGpiR5bEEU91ee61TyIPA==
X-YMail-OSG: .2h3UDkVM1n15y3UtTYTkkiRSlokfH.A3SbdAXyLG129fz3yFtR3Xvg49GlTzHA
 L6UC6gmZ4UJGMtM1DNbcjf.vAvM2lTK65tmUECg1ZmmsPwAkdaFLhwCKZI1HDrA6XoAP54d170CF
 bqS6kR3joYsKklV60YUdLY.mS5QF6669.VIyAJ8x6YzzoLMOCyfbti7M6Ak5VrxtD.1z4fLBjnbR
 Cs4cpo7_S_VM2nUgmH01GoT_M.MT83PSqPnljs0phIp7InhuwiQOWNxMS5837YR3J0bu_raWTRqN
 axG3mZsAmDYSoy5dAhotMuvQyN2jcak63x8NxznmxQ08OBHG95kDjaYzh4Y8QH0Jmzfwu1UhuIks
 xb7mc1ua_sb2tDQh2twCrA89xZ7MWb9Y2XeK5EzAqhnYhlZzjGy_mWO.0qzcxKlmOqVizOpVFzMs
 PWYhF6Bm.NLTbnSphpHriSUULFFGGXFbI9SBaTot3eMer8SO8dckUiVBtrMeJTK6gLELCswVhvbx
 Avy37vwKdZrGrZIShQE4c5AI6_4qWWhcE1XkQTxs1rsCGftx1YALKgiEDBXXQfw.V8dN93kC4S3c
 3VPAAndvZobmCTHz9.k739jzE_W6oj6UUnrDby0NdDonPlIMbES6FqJd8kZLb7AUS71XvKS8bJNB
 yORXB3y39zufeSWStHJRI71pp4gpWrF12Rw2mo0gMhAQmbO1kxg4DgW1CVgwtqI2dFwLHG3knLLe
 .BWuotRyNMG8c7cBBlnLz4Ryz1qbvmXghtAdwVfvCVirEbkG.hs42nXXieWybFa2Ele.08bS4Jhr
 wrGbb2LZm5ivxe39lrSlc9WaFM4DJ_fcxF2arF4JGhTgO9O6f9CSh_nslP6itsUnGyec3b6mi3gt
 r67syhWWFL6nyF7JPhS7GR6Y4MF4xKSrVmbCh0S31xmginT7o7GjukZGTFhwUQ5gNk65LBMNsI7q
 _EVyfjpJnQx.rGwFmdCUbdolxC9QujwhRZzc0ujEKrJSPV3VJNp17orUw3HSeovdm9C8qIJjGNZ2
 hpjqxbnXj2A8AB2dsne_lZ2VzrsaMZ.qczma.4HcOpyO41uyBtSyERbHVN1OWzdxqhgE6vDgH.6j
 4ExJDqZgrjWseRAfhpwPl3A8nqPmr_fPFgu8tJJUzMP2HjlXd2cJ_ewUxJgtt2YXpeI11.rgoKfU
 oF5KYJOzU7FtNOFOsvWyJHeDE1WNzVv206i1dAW3CsxBIKrg_6HU5G4dGoFtJ8cFfC.YWY_R7jKP
 _7BUOnqljvOnpVT9bYOb2ji1rMgkAmq3vLF9XDg9N2LKUaMOaQScls1Gy0sZYSo7CxmxDBAXwY5w
 QE4OmSwRVY2IocH7VfbR_.NIvh6SXgctzvOtm2bgeMvPW.OTgrAUf2.V7AETzNXRcDGNwaGw4TOf
 xCRadiOKuAHbi52ZWhmRMSKqM4vmGmxtxeqxtrf_xhoVmZVNWHkyyS3BqSDLdDtzn1LUl_SHix0q
 bDacLeP7R7ttkEIbYR1ehifIPyMZFP12UD50xzDPfSDmZsLSZsyTlIi0R2V2IfKRy27SePPInsCA
 DKS70yPWfmh2crS1z7g9S8iSaRNv417ioZfJXs3KeJ9b5nZcISOVoT35yV4NmlPV7r6IIHy2ERIu
 t_C.4Lojwdrh9b0O9xHzDNKvH5qtZRVXakwloEo2Xj5Mrt_XOII0aZxi2rWi1U_fT0HbtihA0S2W
 TDqGHdoGAdJqoLAlA3mlGenHXjS0PRJ89n4YgPdOJOywsXl.MR10t00Hk3JmMwUN_K_6Tw8BUL_4
 N519K10XganAFSOTlM4Dqwc5gtdk5YCz5f7.tWYMSp3NLgYzRc.bdU0jBOmUDT_s0TcJ2ZQ9T.Al
 qVKkoaWED8w8szs_EgphAh8iJP89Dlllgy6tr.hfFMkUb5F8pDFXjK19oTC0yd.gnKYq4RiOiki9
 7IpCyvqgJ3Kp4ImuH0nQ0gXKH4RmCWUg52zEJ.Utk5Q.BeX78Vs0BAzxXZy6hC6FbxOYn3VqWy.2
 UoGkG8Z_v44eIKEwu62m9PCiZEY5I50NyW6E7wNfvE5YBiQvGIqkb5ONCOOf2Sgu3RYHynO7fc_s
 gGEK_d8UHuNj5No.56OOnLRjgiwJ3B1gnDeMpszASrAWeTAwldH7fSrrnRnWqK0ABt2T8fm3MIqh
 3z54U2Z4CQTPj2HU0oxvrq.zc.Z3m4YoU._W4Z2Svrh4Msueul2HBf9_d_k81k.OufHK.Vz.n6yv
 o9gnRhw1jC8INup3Yl3nFam9BhWas6M6Vp..syQ3Zntlz79gK8_cVqPeA7.TjzZyEl_D62Q93c6C
 Cnncqpql44lBKVQst8rF5ImZSt3PIrnmXcd8Qp54AwMx0OuZbc8jH5CFg4_k.KHVE0ux.k89e4fZ
 YlqQ_2AW_bV5h4DtTnMzCuoADJz4Dt7.G6mEnMpLEAAxjPTcnMNxFVTY3yQV_xR5HGQNFUyR5gqH
 lxq2dVjVUiNtFc_WmEEtSfTYqcqr9mFnjV008fzf5htF_0z38nev.vH.sk5zYUg--
X-Sonic-MF: <pkt_1@yahoo.com.hk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.sg3.yahoo.com with HTTP; Mon, 29 Mar 2021 07:19:46 +0000
Received: by smtp410.mail.sg3.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID f26805c7992f713fd0e92004abb54fd7; 
 Mon, 29 Mar 2021 07:19:45 +0000 (UTC)
Date: Mon, 29 Mar 2021 15:19:39 +0800
Subject: cannot start  my machine due to an network error
Message-ID: <c5daddc3-e1f4-46cc-8724-d7d44fe32868@email.android.com>
X-Android-Message-ID: <c5daddc3-e1f4-46cc-8724-d7d44fe32868@email.android.com>
From: =?UTF-8?B?5r2Y5pmv5rOw5YWI55Sf?= <pkt_1@yahoo.com.hk>
To: qemu-arm@nongnu.org
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="--_com.android.email_238436569487140"
References: <c5daddc3-e1f4-46cc-8724-d7d44fe32868.ref@email.android.com>
X-Mailer: WebService/1.1.17936
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
Received-SPF: pass client-ip=106.10.240.145; envelope-from=pkt_1@yahoo.com.hk;
 helo=sonic314-21.consmr.mail.sg3.yahoo.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Mar 2021 04:39:23 -0400
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
X-TUID: HuiQ4zbSg4X5

----_com.android.email_238436569487140
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPmhpIGFsbCw8ZGl2IGRpcj0iYXV0byI+aSBhbSBjcmVhdGluZyBteSBx
ZW11IHZpcnR1YWwgbWFjaGluZSBidXQgZ2V0cyBhbiBwcm9ibGVtLiB0aGUgc2NyaXB0IGFzIGlu
IGF0dGFjaG1lbnQuPC9kaXY+PGRpdiBkaXI9ImF1dG8iPndlIHNlZW4gc28gbWFueSBwZW9wbGUg
Y2FuIGZvd2FyZCBob3N0IHRvIGd1ZXN0IGJ1dCBubyBvbmUgc2hvdyBvbiBzdGFja3h4eCB3aGlj
aCBzYXlzIGhvdyB0byB1c2UgLW5ldCB1c2VyIG9wdGlvbnMgdG8gZm93YXJkIG15IHRoaW5ncyBm
cm9tIGd1ZXN0IHRvIGhvc3QuIHBsZWFzZSBoZWxwLjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5hbGlj
ZTwvZGl2PjwvZGl2Pg==
----_com.android.email_238436569487140
Content-Type: text/x-sh;
 name="launch.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="launch.sh";
 size=568

cWVtdS1zeXN0ZW0tYWFyY2g2NCAtTSB2aXJ0IC1ib290IGQgLWNkcm9tICcyMTM0My4xMDAwLmFy
bTY0LklTTycgLWhkYSAnV2luZG93cyAxMCBFbnRlcnByaXNlIGFybTY0LnZoZHgnIC1zZXJpYWwg
bW9uOnN0ZGlvIC1kZXZpY2UgdXNiLW1vdXNlIC1zb3VuZGh3IGhkYSAtbmljIHVzZXIsbW9kZWw9
dmlydGlvLW5ldC1wY2kgLW5ldCB1c2VyLGhvc3Rmd2Q9dGNwOjEwLjAuMi4yOjMzODktOmxvY2Fs
aG9zdDozMzg5LGhvc3Rmd2Q9dGNwOjEwLjAuMi4yOjQ0NS06bG9jYWxob3N0OjQ0NSxob3N0Zndk
PXVkcDoxMC4wLjIuMjozMzg5LTo6bG9jYWxob3N0OjMzODksaG9zdGZ3ZD11ZHA6MTAuMC4yLjI6
NDQ1LTpsb2NhbGhvc3Q6NDQ1LGd1ZXN0ZndkPXRjcDo6MzM4OS06OjMzODksZ3Vlc3Rmd2Q9dGNw
Ojo0NDUtOjo0NDUsZ3Vlc3Rmd2Q9dWRwOjozMzg5LTo6MzM4OSxndWVzdGZ3ZD11ZHA6OjQ0NS06
OjQ0NSAtb3ZlcmNvbW1pdCBtZW0tbG9jaz1vZmYsY3B1LXBtPW9uIC10cG1kZXYgcGFzc3Rocm91
Z2gsaWQ9dHBtMCAtdm5jICc6MicNCg==


----_com.android.email_238436569487140--

