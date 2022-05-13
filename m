Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp372518lfj;
        Fri, 13 May 2022 08:40:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypa1SmY+2Vj1vJoktNXQfZY+XLkdeoTz+mqGZxEkTLkmdJfdEk/KLi2Hluz5DP4v+b6HVu
X-Received: by 2002:a05:620a:1339:b0:6a0:ef59:a567 with SMTP id p25-20020a05620a133900b006a0ef59a567mr4180153qkj.242.1652456439084;
        Fri, 13 May 2022 08:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652456439; cv=none;
        d=google.com; s=arc-20160816;
        b=jYnY298agSmH4arXCJLDs2GnWlZeURlsoL2xAz4ItJd5DZjdU5wBD4EqwunChWJ+cI
         GNAmEkbnXPiQ74JrqRkmyyh0tOlWKBGucCaxCQXo1liQCTYV1Uk3rnw9QO9EXF/E+B76
         efuDuJaQ4slv2sKxaceovMzOkgkXjHxWTqRConI/TbNUqZ66l2sq5Wib6kF7AEETxNpF
         Wjzrn2FLy7mqxpHbCp1xAomnJtiBO77SMLGmabQDRXkOo1dDjP2XHZGex2md6YbIMk76
         5JoDonb4WXm28xNpiI9w/Q7SJqLBFaYP5jJm3/Y2X3Nvjzg1xaCO3BqcdWn9ccQt6F/b
         1nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qPvZqUMUi33V/IMJ9Gkx5FlS8PHYJNYQTstS31rc0hg=;
        b=n1afMw1qdt+4aAv1m7hxxE5Tqz30FSmWdJuLuzerWpj0pms2OdHYvn+iFqQVelF8XD
         zgppwBOhuYXVaSrbrNVicVu+SpjGOjm37NQWtjYhgBhgkQd1TiAPvonQpM3DBPz4WXhU
         3RSpsWgpqfaSooRmEqXAI6K6A0hxrkS2aOSkt2hd8jGy/FqsH4+Ct9QG3YpRKUXu3bA4
         vqgNMIWOrKaL2s+yglxsJXdOrk1mb58ReTld/gDLJaeasrDcr4FZsa2N64oP8btciZRW
         MdC/tkmBEYfLraphELqBJwp1mOLSyaleM2lXXGUSKiQUNwLzZCabfGuJUO9ULnwG4Xzp
         MxWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/i7jy7m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05622a100600b002f3f7d66419si1927363qte.248.2022.05.13.08.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 08:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/i7jy7m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npXPC-0001fA-GT
	for alex.bennee@linaro.org; Fri, 13 May 2022 11:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKx-00076s-Ms
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:36:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKw-0007Ej-2V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:36:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id 137so7835795pgb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qPvZqUMUi33V/IMJ9Gkx5FlS8PHYJNYQTstS31rc0hg=;
 b=B/i7jy7mnmwxjK97FpFW8Jbp5E5wl4ixKEb79d2Ww6T109wcoFD5r0n0ToM+Z3abM+
 fwEzox0KcyqRF61DqPnLxEYV3xzh82NnFdA9R+FSnDyPXDuglzqJJU/rl7e/rjKIWAUH
 ZlpJPQbGpcyYySQ1HgOB4L8OKHli4B8zEQpwH9PhwqUpLD8wzEsQcBy7hMufZHoupenz
 OJHhVNRrB+cx+uvg32uY77sctSiRJmduIOHokWWRLG9tVClQ9M89dcsip7vXUd0QOO84
 8DwuVPar3oUntp3EXCzaQK+fOgOHsP+LU8GTMLq2ESn0Eq01rApXkkMN9OmCn/10JCLZ
 GokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qPvZqUMUi33V/IMJ9Gkx5FlS8PHYJNYQTstS31rc0hg=;
 b=bjdiTVbJyIXFQpGggxWQryyZlRnCaT2v8ZlmHQYwCF8LMC+705z4OEpg5jBcH5oNKn
 TfgBJTnos2GDShTOG++rKR8fFmjAaj52G9NmT4Yocir25cUUjNiJw8jTY5aS0rhzwlNG
 rFEwrbc2/68ozM/w6UO5/WiUtfR+vR1fcSwkDhZv1llN/Zl7HdV9So3W7oLJoMaRRxDK
 Q29gZJjtiOWFQk7B9EC5TQoznCfWVAF65cGpByaT985uatw1GhjJanBCIQKdVH1JzPw/
 OpT2kVz7noDZ5GdsKMgcRyQoI3A/6j7AHrCFE34HRL2GCdQut2kH8Kd9oy0EWNBYrdI8
 C/Iw==
X-Gm-Message-State: AOAM533Hkagjr02G8sYTNuNH9kfC2VxofqeoT5jogMkRVPEHDOUGeC/Q
 MCVoFvQVShrwMtYDlKA4zZrcWw==
X-Received: by 2002:a63:6bc6:0:b0:3c6:b38b:a84 with SMTP id
 g189-20020a636bc6000000b003c6b38b0a84mr4451971pgc.422.1652456172814; 
 Fri, 13 May 2022 08:36:12 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a170902d65500b0015e9f45c1f4sm2000463plh.186.2022.05.13.08.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:36:12 -0700 (PDT)
Message-ID: <2006033e-84db-b977-0550-87612ba579e3@linaro.org>
Date: Fri, 13 May 2022 08:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw/arm/virt: Drop #size-cells and #address-cells from
 gpio-keys dtb node
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
 <20220513131316.4081539-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513131316.4081539-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 71YtA6qEjYC1

On 5/13/22 06:13, Peter Maydell wrote:
> The virt board generates a gpio-keys node in the dtb, but it
> incorrectly gives this node #size-cells and #address-cells
> properties. If you dump the dtb with 'machine dumpdtb=file.dtb'
> and run it through dtc, dtc will warn about this:
> 
> Warning (avoid_unnecessary_addr_size):/gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Remove the bogus properties.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
