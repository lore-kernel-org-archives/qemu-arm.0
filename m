Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2234698lfm;
        Thu, 30 Apr 2020 11:50:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypK04m7hYu3haRvI+Rsj0+x90B2M44lKcpfnie8CA+T4KyGI9CH2wfuIytL7da4s6/arNLhz
X-Received: by 2002:a37:7c7:: with SMTP id 190mr5128261qkh.477.1588272635924;
        Thu, 30 Apr 2020 11:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588272635; cv=none;
        d=google.com; s=arc-20160816;
        b=Du8ozuNHtEOfnrNYBVQXdLqL9506oYXlFDjZkU7ynRp9KIT74SQCjyaRhh/Ei+sFKS
         ZW+XJzsejyBJ+eKg58dRwKAHA+gyxJ5NTkJgF0kawxgMFXcD2frouEJP8T2uBEunO6vU
         uzQ20GOrijm3FzMMC9FEb/CH6Xang9iWcpEvYB5qOS/9WaIgMtf6FvVs2QAfmTOFyQXI
         OZW0vS3rfNrBY3A4JkChOuTtQ+6aNqSBT43tboJmDROvOzG05vGF6tlsDTkDH3/ZnqVW
         DvcPIsFczctOxO0msxLvhK2JGWvpaU1xr9GBjCjbBCx5KVS29CWr1j+s3Y4wbi0dhPIr
         c2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+SfNLTHB7OlpSFGRIdIInO8wWUmEfnk2kky7W8E7omI=;
        b=g0j4FlTbUQrl4S7YWbmai6aVslCTXemce414Z/mYVnZZmbntLQ2N1VBGg3o8bvS8fX
         tA/RlFmmcop/jgU2Snj5iLlDcjtiUmzbfcoMDx9M3d1GuSf+QNGMSXFYQ3e/YDLq/knI
         LVB4O21+Ude2OIlwEdxEYztorhxHUNWQJqsHF0TxeveR+IXMxfpaZCH+ujxMVXlkJaqz
         09CRwxYOLnZpYWEN9aGoVAhsrfQzzQgx4aP/BliHSDSS96JgRqu/Gsw28lHrezz9qkxD
         7yABdPvD8UllITmLViRSAmKXIfY8HeW36TSvW1+0AHamo77YbhT6V23EMU+Vd/uaK3+l
         WPiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BR7SmeG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x48si310053qtj.283.2020.04.30.11.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BR7SmeG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEGZ-0007Da-8c
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE1h-0008El-0r
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE1f-000457-Ph
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:35:12 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUE1f-000443-A3
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:35:11 -0400
Received: by mail-pf1-x442.google.com with SMTP id x77so248573pfc.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+SfNLTHB7OlpSFGRIdIInO8wWUmEfnk2kky7W8E7omI=;
 b=BR7SmeG38LVLzYoPtvRUMrvrBVKbmmYtT5cHvcJuBDwrLak7vF23K2v4Ep2c6mQ6PP
 aG6qL/A7lLDUnz76wWUBUJ4YTMe+QHJt1LZt6VZ/Rw0Rxxf1hsVbTAv0bC9RFyhtzdqV
 /Ambkv/OXy0+xjaZNUqCN/FN/t9MqvF2FbQZCRKQ5/lezWxkMy/n+cipnQDU3RPqkeDE
 8mhVDhfiITsxdn2pTdPZfv4TeEGIMwn2iWG+5arwRoYLapq2dVArV4fB8Py8J3fJo+Do
 rx2hlz/SmZzdgBSii0SuNsUSF8d74OjhRLdWZ9ZMz6phd6Uja+W5JTvT1cTlCQyfAcq8
 QafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+SfNLTHB7OlpSFGRIdIInO8wWUmEfnk2kky7W8E7omI=;
 b=hyMMuWU+r/ZQfC0IM7utMKn4EgSPW9tTgDJFLonHBj2zjnJTk4T3jqIl1ssIYrYIaj
 B/DB32YPllSVmPbW1lD/2y5T3CgfaSV4nxB0NAaaxesGFpDOuo6Z2JSXPwx8vvWK3SQR
 vw9vSW8P/+zHax29BR3A/XkLjY8UOJ+tfb2EYMUeJD45dxopMUnwi37GruzGoVnY+Yju
 DRfEmNbagrrXLhAs0WEYQgVFe7Pn/1xhRjygjdoufD+BYfyUr8N9UA5GBBPpnXMa679D
 PX4rD5rMbRKWKC067cn7mNdGf1SpMwJUNMVpqz1L2UN1eIbdyf4tNIjechlNFshWKCuf
 kShw==
X-Gm-Message-State: AGi0PuZ6SlxBayWwnIFpr9/p3tbvulotgjVL8o403fKd/84Yihu5Oqy2
 HqdT/JTOlpG2OcNXZDHEP3HSQg==
X-Received: by 2002:a63:1348:: with SMTP id 8mr269239pgt.350.1588271709649;
 Thu, 30 Apr 2020 11:35:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 1sm406839pff.180.2020.04.30.11.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:35:08 -0700 (PDT)
Subject: Re: [PATCH 05/36] target/arm: Convert VCADD (vector) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7899c66a-7f4d-48d6-7ddf-43fc81360eed@linaro.org>
Date: Thu, 30 Apr 2020 11:35:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: fwRfNwryhQCN

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the VCADD (vector) insns to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 37 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 11 +---------
>  target/arm/neon-shared.decode   |  3 +++
>  3 files changed, 41 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
