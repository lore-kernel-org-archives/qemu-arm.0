Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp168268ejy;
        Wed, 28 Jun 2023 22:43:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gkqcbQMo0wmcxfuvL9OmnNh4IGfCpD5dheP3tAx1S9mbwnfaQE4RnOD+jx9ygdEStsMUd
X-Received: by 2002:a37:e10d:0:b0:75e:14ef:c2e9 with SMTP id c13-20020a37e10d000000b0075e14efc2e9mr36305435qkm.65.1688017430939;
        Wed, 28 Jun 2023 22:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688017430; cv=none;
        d=google.com; s=arc-20160816;
        b=u8i1b1axxqUTGS5uwMOx9pEvs9fOMGd8AZPOZ+9lVXofeGnM4psvJ8oiwXJyLAwgoy
         i1bEcKpjJBFj15Cq2ueL8dJ5Powr3cKq7g4RrqHJ2mf5NnPJ+tijlddSgdgxVCJAaSoV
         XpSkOTXsBN+pJHqkpixMNsj3mGyVelZCwnhlCd5s00FgmKPjLCaGWF5y/nIKHDMAroeB
         5VwzDQqWDSqw/Kn87i7bppTBIHl7nsGvl2T79HnGuj3SAuTWp+XgEWgRSDxazJrw7lB0
         hQU8Z6Pexz9EKno+pTJKu0Yjcy7DyJ1t1AhT0xOZdKZ1Cwz81Q6N2hq9CG9D5UNH+X0b
         g90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=umMXftmbBXYZuty1qYfhY8CVz69YoHZwGqbT9LCQYnM=;
        fh=xU6iUzoUBtkJxboiQB0MF4hmbPKbzTkYGqf5ylFAN6I=;
        b=YyWXUKJuOTa/ae1XNTsCn0+RvgBnLyw7T7kMCHftrFEAFCJ3EXAzewsqaKgyGe9ref
         vyCGmeehxbOuV5qS3xjKDB7sVLofadYv4k/X8tuzxSmnYgQn3YwMr/RVISXSMTcadOxS
         440q2OwLdd5CFgcSePv4NYUOPSpUiyUh2/9HFylKXL2gxMfe+9cPYjVeCsn5BLUc20t9
         33QFbVuM1enzRwXFuiO3PkBpJK3wYaACPnGfSfAlb9RkbQFcXuIttJew7PAFU1+pCx9i
         92gqKn4gBs2cx/FZmt+3uwtJETZ1XBZYXAM7issr/dslADn4skCNl0UYwYI1c8AOTs40
         fZWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18-20020a05620a291200b0076718a3ad56si3094144qkp.185.2023.06.28.22.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 22:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEkRD-0003IP-V0; Thu, 29 Jun 2023 01:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org>)
 id 1qEkR9-0003I8-7p; Thu, 29 Jun 2023 01:43:23 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org>)
 id 1qEkR7-0006qZ-Ag; Thu, 29 Jun 2023 01:43:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qs6mz6H5wz4wp1;
 Thu, 29 Jun 2023 15:43:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qs6mw1NcVz4wgk;
 Thu, 29 Jun 2023 15:43:11 +1000 (AEST)
Message-ID: <4f2699df-5d22-5642-1d0b-80414aa8750d@kaod.org>
Date: Thu, 29 Jun 2023 07:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: Sittisak Sinprem <ssinprem@celestica.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 andrew@aj.id.au, srikanth@celestica.com, ssumet@celestica.com,
 thangavelu.v@celestica.com, kgengan@celestica.com,
 anandaramanv@celestica.com, Joel Stanley <joel@jms.id.au>
References: <168794501779.28884.3336012012258765799-0@git.sr.ht>
 <cd38a154-d5c3-1e22-c94f-9e1d74069f6b@kaod.org>
 <CAE+aGtVDXtPbZxC-OJvQ0R+dOk0S=_gx+0wfyJ+wbA_xn=NLMg@mail.gmail.com>
 <75e183e9-f253-60f3-c7bd-a064b8887ca1@kaod.org>
 <CAE+aGtVs33sbcQJrW88H7E6ot72cBnJC=OPZYO0saEo3i6Mr4Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAE+aGtVs33sbcQJrW88H7E6ot72cBnJC=OPZYO0saEo3i6Mr4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: McGFs/PLvbvU

On 6/29/23 04:57, Sittisak Sinprem wrote:
> Hi Cédric,
> 
> I had fixed the function name to support in current branch,
> but facing about below error while starting
> 
>     ./build/qemu-system-arm -machine montblanc-bmc  -drive file=~/flash-montblanc,format=raw,if=mtd -nographic -netdev tap,id=netdev0,script=no,downscript=no,ifname=tap0 -net nic,netdev=netdev0,model=ftgmac100
> 
>     qemu-system-arm: device requires 134217728 bytes, block backend provides 27726336 bytes

File ~/flash-montblanc is too big for the mx66l1g45g flash device and
128MB is expected. Use truncate maybe.

Thanks,

C.

