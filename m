Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1809103ejc;
        Tue, 12 Mar 2024 06:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJsZ82CxgYMl/8etoN6OMSYe1atcCCu8EU/8haWh1KpfN8Tn19NbYgnPxL0VkKnwetSeBE3gCSyii5FsF107PcnXYuBunA
X-Google-Smtp-Source: AGHT+IEYRfPTVisKn1VKqVW0ea2LPFOeIH5L16KUFmF+3G/KHVg5kmCLhma2FPcKHqrQ1zrvqY6G
X-Received: by 2002:a05:6122:88b:b0:4c8:df97:139d with SMTP id 11-20020a056122088b00b004c8df97139dmr7789193vkf.2.1710248990601;
        Tue, 12 Mar 2024 06:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710248990; cv=none;
        d=google.com; s=arc-20160816;
        b=iElt/LZh0xMJ2ULzVPGsj9v3iTeb7ufhF/pu1ZqiXwBIUvbE8tkQxeescebTFH8DGP
         FyCbY3Azei8rnenF/jNkDl62ahOnUE0D07UqUlYr8PiR8wOjp0M2QEPEHPyI/4beU506
         VzfDSuBpPzTJFWEi4TxOZpj1PHlggNN7X9zGJUhWTyDdLdm+EEUWGXHDxpJyWK8yxl+n
         e0F+eDi0Q0YtWdRIy5ikXpfKXDK5mIFqEKjbKEx3h8cN73/63fHCDR8ayLED7agV7LhY
         J4tnUVr7wjvIxi17EJOewNAzh0iqE9/X7xQXjl7uvkvCrpxLa8Yps3dchhHqnutQwHnv
         8QDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:references
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=fGLMALKatNo+wZeNHQL+HYSXPNVDCyPKBUxn5ctg/zY=;
        fh=3EkCcoIvNSwlrASCcvqsZ/s2iF1sUTSne1+2h6/BaUw=;
        b=0ULnRaG2jjxzTR0xY9T5skkLq672NzTZv5030O1Eg1s4Jj30YsQulWzWFv2n10OLXJ
         +lOt5586MMOTLaI86bOWBJlQwgx0J0LOZHaCGsO6hPXQNB4hWPVhr2zu8AfJIa3cAXTD
         vetb1hIRO5or1yi8lSdvkTRNEnfLAB54uLEMa6gFQAEuIVvW2W/oOoaxJpxpYiND0Ve3
         T02ErvW2W7ArtETW/EPCtjQVLh/RyGcnSz1RFiB3dz3B+PN0+/CLkdw/1JEgapgH8gfV
         7lPN1f/F07vU9IUJHSVSQEvTdREFEkalIXH1YcO16tk3UFuR8V20fvYetMCnK+cFZZLu
         xe5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.co.in header.s=s2048 header.b=F0+AS2Hz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.co.in
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec30-20020a056122369e00b004d40ecb278esi49266vkb.57.2024.03.12.06.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 06:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.co.in header.s=s2048 header.b=F0+AS2Hz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.co.in
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rk1sz-0004uj-Tq; Tue, 12 Mar 2024 09:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilprasadb@yahoo.co.in>)
 id 1rk0u1-0004ai-GJ
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 08:06:42 -0400
Received: from sonic311-20.consmr.mail.sg3.yahoo.com ([106.10.244.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilprasadb@yahoo.co.in>)
 id 1rk0tw-0000f0-Tz
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 08:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s2048;
 t=1710245184; bh=fGLMALKatNo+wZeNHQL+HYSXPNVDCyPKBUxn5ctg/zY=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To;
 b=F0+AS2HzTbQI4GdZZQgUFpgS6JIYKliGw7WPQLdopnAjJ3kxZwbavsddgSOA+QdgPjXBH0MKlISbozi91L7GhqAckqS/UFx3uj9JFq3sGrhKv6HDVE5oXvb0C/7Dx4fOgAWggF3ulIbSz6i9xyudVFEN7nMtxE859+WqunK9YDA9bL/z2PxjT0MFUzN6HYLOiqOKQKtUwDgqHKgy0NTYSnKXkEYI6/SnQMtot2ZLbbg4OwqJQ8xpOTgEhX/+XSu75G/J5dpeRHjhe4kRBt8om3SimNxEwh9CrFqf8prCxxLZhksG7Jk2eorpFsHZ95G3TJxOgoR02HvkadjQcY2peA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1710245184; bh=RPSVYZ0GTG7s+1puclxqB2qHEPMhAmv1GnDDzfLwhma=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=S/YdBiyk4dEO6O7Eslemkot75ErToDyOgAH/p399zszMZLspy9Pc7nZB0l7a08OZE+oMwVQgE0b4vvr9ftW2JNHF9YpbwHZMeegcHSvnys1cFzzQwQapAdvQy0avrXuevgEL6EFeDZtkbrJfgukzixymNC8Hqo8hLtd5g2SlRogHA6GttRE8TerBp9f+0SN4H36w2WAHs3u+t8+SILPRdtidx6u+nUGqEjK7FJTS9baveoksxRaOiPNr5c5GPby7fGYPvJTQMkhRRGPwFGdPDBBGIjCe7KEIzPNZljRRxzwAVCcqBjIbp2dMex6rKqWBSw8/Adln7MzYOlOLSrKhkw==
X-YMail-OSG: Hh5D.xYVM1m2jxlr3cZJHXMJUktBchZ3SP5GuW07FvjGvGhu.dXUKu3iUTH2iWZ
 MTYpkXEG37CkovI0UM8mxRs_BR6OIXc.8SV44BIKy8xMWwgvcRQ0SJxFhoXrXtovEwhU3lZEary8
 EdPTojtT4qYhtLi7eyKbqphc8KH8NibEIRJe13P3wJ3MRzJAWDE9R2eBZ4W3mk1nffxk9w.1x2qH
 XKMmMoDHQjYq.CE.rgz_1_ma8w8xwAWs2NQrJra03_14DyAcd6Rn6cjs9gTGzVWxfVu97GEPIC3L
 Ud4q6IIrMMXXW24HWTnSMm_9FonFPSIfsRJ1jORdZJLI1mjFTb7YpzuVaSgCyJy3xNVxflxiZBG0
 tFsWULH_PF4_38wzARQGH7XKq4ThUymtDn.2IyxqF5CexhB1BQySJ_GfbVZCMovCt2sZ_CByqExN
 _I9qNvW.iBoRB2nfjaHmtZtzt6QfuI1bqMfVENO9UU8wNjxe60u0Yusso.d6TLIBw5tIZYj9cBfM
 XoPdkxtpeCN_ynORcFH9LhHgrGaA6WhzdqALkTAOPRALpO4IdvTNsBdaUIwUpNwvqZMI26C2UOyz
 e0dCu7puiS56uLwTVQDkqktA2_h5UrEgNxv497l41x2t.PpTHJzYNN2qMnFFpTU1LZckI6U8ENys
 12FQly_zAEexI38adf7V.fBMUEms3uzbnxA8xvWPDak_kF4gf5KUWed9z4LZGXeNZ3svm_DHk7jd
 Va.Sb9JIK3nF22oeiXHQz2VCWgpNgWy5flhdsiZvXnX26gzFPedegLUQUcWWOoWl_EquuLEcKP1D
 b8Io9EZ_4Dpuo.7gj662nyVYC7FyOLjW81gqOj124kzx3jPiRgLAFOb.M4DL_T.yskLhnxUJazBL
 k2640Fc8oyKjf23MPQ4amVS2qbpm2AZLxZoV2KX0KAHy0q0DRpBw7RRm4jT5IzH_YyomSZOIULri
 _hGiNUvDgqi8xO8Sx8Ydkkg8oRVf7dn6EAiTuC0_N.tZcV3VWNFNkT2isYo5M3TGkMAAumuABfCG
 QWayYDujpasVcGTU0iRgTVAgsvzt4rfOAnhY08XCR5gkVZQrAauUJ7site9AMvFJZlFnDuu96tBe
 UOUtFTpsd38Crk4_opb7Tkx8e0mZ3IxqJa6K5qyGpYiAToQNzPOvuQv7LAnLthT1LL4PYVgCy0Wx
 HLiEgQ.6FX9VW_Yy9OK5h_ttgZgqYke_K3Zgvi5.2ZSbfZzXghyibPW9fcS_t5I1I0Trvfhozk4M
 3Nvw60dX1BXhwc4QDqUSxyKW8C70Xo4KwyTJNZsvxbYFUH8GD3FI0f5zNNH7wTOtWtf6SFaFXkWh
 1KiD86arbln0mckn2cXBH1tGNzMk6YlCTsBntxB7AZKYVvgSz8otfHfa92hW62ph0V_1LIGocZxy
 nz6M1.eHNo1EWqLDqdEx03n.ngOCTN2dsACeG.UQ87L7pdhB_l3d6xoJXMiCxj9SfNR8k1o7GmMG
 1i5b1RBDuRj.oIfEbW8DU8OwnDN4kb8wv8bbYbbOAAO9mFT2PYFd0bHP2jTAHslv9MbyU2lnlsE1
 J1zXi5HpeiV2WQ47dm8E4G8vRCvqOlc25hwuRlSB5cDI64ttxbXKLV1O5mHTbAF81Sd0ZpQQEsao
 BMrOzQh2JUH172T_AC_Y0dn1s_.3XmqeGc7FyhwlrMAATFc.wAwT1bUAVxW0pSELC9GpwwEWortr
 Mov7QCmtCGybA76FftqVMadeTnzB6MhPkKdQADIMQIcrGwIJDpK6XCV3cYy7q_qZviMvwPNdsVT0
 pa5oSTDhdKbpuuLGkBgVXroIKeC3YP1_A2znhCjqA3MULZvjaUtlnI.SDDVEyT4OuI6YzTbtAH1H
 ikIHFfood.q944DrZys2Lrbep455iXf7VYXh5Kd9tIquSQ8h_Bfj2SNAaq4NU3D22zkX9w1GF2Gk
 81LJMe7KObwQjnDz7EjI0J070eOCEFFXTWzKzsZD04LR1g4NvGGO6PMHlJtUn7qRLNrLft0IUh79
 K1TZSnW.aY8i62Rm.7PylD2c0glKO_adp.0J4.QcHyr5xJI1hAMY1ZlRHV.JV8Ro9pikQegPoNMh
 4n0XBMNQGijrDRUfvfR0yW8jc6o_Y487w_TCRjX_VkpBbC.0uzMl.yaWiG54M37cAHlws8J8CxUL
 6yi0PvIPsJ7FpIcsoswRStxMNDvLMpwmqMzXA0_e16N2cvYmMY5AbjSXIqoHSxLMyZ_MggKev2Te
 oilQITEmg6iOkb8me9d_7iH08YJjSe5L9X7QgoTg74WGzfGxEgzDpcO_.WpwrPE4mX_.mMA_CWQ7
 s4LHowI9W5x9IYxhhdOklmEQVFPTkg93Ruj3166sB6gddaf7VKO0Ff1dAnKZ_n2s92p0Y9EHQljx
 aauNF51jbnQ4-
X-Sonic-MF: <patilprasadb@yahoo.co.in>
X-Sonic-ID: 09538e03-a6aa-4d20-8bf3-e434a816a9e7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.sg3.yahoo.com with HTTP; Tue, 12 Mar 2024 12:06:24 +0000
Date: Tue, 12 Mar 2024 12:06:17 +0000 (UTC)
From: Prasad Patil <patilprasadb@yahoo.co.in>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <1112676651.2089918.1710245177914@mail.yahoo.com>
Subject: Machine type to use with cpu type cortex-r52
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2089917_964694638.1710245177913"
References: <1112676651.2089918.1710245177914.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22129 YahooMailAndroidMobile
Received-SPF: pass client-ip=106.10.244.37;
 envelope-from=patilprasadb@yahoo.co.in;
 helo=sonic311-20.consmr.mail.sg3.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Mar 2024 09:09:40 -0400
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
Reply-To: Prasad Patil <patilprasadb@yahoo.co.in>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 33L+tlFh+HX2

------=_Part_2089917_964694638.1710245177913
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,When using virt machine type with cortex-r52,=C2=A0 I am getting error C=
PU type cortex-r52-arm-cpu not supported. Can you please tell me which mach=
ine type to use with cortex-r52?Thanks and regards,Prasad Patil=C2=A0

Yahoo Mail: Search, organise, conquer
------=_Part_2089917_964694638.1710245177913
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,<div>When using virt machine type with cortex-r52,&nbsp; I am getting error CPU type cortex-r52-arm-cpu not supported. Can you please tell me which machine type to use with cortex-r52?</div><div>Thanks and regards,</div><div>Prasad Patil&nbsp;<br><br><div id="ymail_android_signature"><a id="ymail_android_signature_link" href="https://mail.onelink.me/107872968?pid=NativePlacement&amp;c=Global_Acquisition_YMktg_315_EmailSignatureGrowth_YahooMail:Search,Organize,Conquer&amp;af_sub1=Acquisition&amp;af_sub2=Global_YMktg&amp;af_sub3=&amp;af_sub4=100000945&amp;af_sub5=OrganizeConquer__Static_">Yahoo Mail: Search, organise, conquer</a></div></div>
------=_Part_2089917_964694638.1710245177913--
