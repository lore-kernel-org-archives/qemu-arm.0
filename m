Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2299246lfm;
        Thu, 30 Apr 2020 12:52:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJlCd7LkVi9ytiKbXM/7TZz6q/4v52G4Vx7KETeocG4M+bGE/5G9Vukgt+X+nAae/iNOzMP
X-Received: by 2002:a37:9e08:: with SMTP id h8mr109364qke.369.1588276342228;
        Thu, 30 Apr 2020 12:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588276342; cv=none;
        d=google.com; s=arc-20160816;
        b=etfSbYLmyxMPOgsJCxEHty1jVAHmE0PcT5qCyIauWNxDmKONJBmjBatW9nCbWbdkvN
         ou6zsLIJoNS2VcSaWvOQrTuaNCnUMI/rZGXf0vn1+VXweIH1lbAoOmIRnOfi1RffuD48
         jYBADPD46kRQGS85UN9n9H/4W7ksXNcpN2ooOSk22APk6ilhEKaKWAG/G6Y8v7VkfZ9W
         9sL+sx5bIJvfutX97ZgQavOhlvntl66zQHQCfuZvoN+GmUfu4M3oawLTJ+uwLlWVFXxY
         y/Mj7kbxvjYL0IH17R1+vt7Oi3bsGuR0YJJvhPWKHBnflFi1Yg9brVMwEItPbdooynhA
         ploA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZtIrSrAV4lsSH1lBsBv9oGsR1UrOCm1sCFGIH0Bw5eU=;
        b=cLz8RzAbXoN+dvaxlp8NpBGRQRsA33zALjLaCE3N9CeBieuG54tsBrtZom/dgwz8Dt
         GchTtOa3zoltPTLq50uRU6ZhdOogBZHhJ1oWUScivZPyw0StOgVnat7b1smpEvtAFWdV
         jEsScgr4qQ17SmuTygg56hU7aAjH3gf0alKXxPWwcBH82iNXBkyqTckuX3XJpWHRyv7c
         A9w8a4K53C+nZtDlRe11agTxvboIQ5PUJaFJraWnk5WPjeNtK8OLZ5gXR3AU1zREyOE+
         DNVoTory4BkVQOrqNu2IvK7KZeHs/LGb/5kIi+EsvpyFcRL1R2gNyPQ4Wu1km2HSXKNI
         MxPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upQqfGsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m1si524938qvk.20.2020.04.30.12.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upQqfGsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFEL-0003uC-KR
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUF9W-0008NX-Uf
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUF7b-0005hR-T7
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:47:22 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:34959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUF7a-0005fP-Vq
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:45:23 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ms17so1320693pjb.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZtIrSrAV4lsSH1lBsBv9oGsR1UrOCm1sCFGIH0Bw5eU=;
 b=upQqfGscWGwb61/k1epVw0L0KJ/FnknounBfrlNeqaErX82PhvNMHtEUd5DUiCMPdF
 W6kRiyO2mjotn916oRmNrfC/eP2TAAMej1rOa7U6YD1wgas1z13H/Q5HsIhOpN/hcD/P
 6XCQYbry+8UMziAAC0DYnZBAHL8GKolgOXaHe2qF2naWcz4wKhXl8dgRKmXUOAkc4wcj
 tHceV3EBn7ncwZWTTiIh7Kv5RqRq4ldngRIptBTtqpyQfHpEhbk8iGGkSDbeYGM0xcC4
 MCYZmsZMqX9m0aW/uobyI9imb9xNTEoXBYhDP3YK3OelPOrF8l21k83XhweU18MSfAdL
 m+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZtIrSrAV4lsSH1lBsBv9oGsR1UrOCm1sCFGIH0Bw5eU=;
 b=lWWObubie09AlIlX69F+rze//yaESpJpyN62QCN+wv9SeRHhdkz8YIWCWxGtypXdOk
 ZpB4/j4gwvyakPpA6KAi16DpbHA4sQxIGPRReezQVrV3Gh5WskQNGTtIuzsfQqPIUIxd
 mVpHqWXa/mB348gWzCpj7lPVDfTbqENLDcVOslbd9U5nKISGTJr+rwIP4obQs7msH+Tz
 MuAIx/ydvIa9nQqgE0zIEXW0eZT+PzszddYlXUwxzXWk6TNuOyCPDmLAlz6IN5rIT8xc
 WO1PQBVmcTwHbFKLjhJaiu7nKKmT/6iI4rO6KCwyvqRkpTHidFhC56ro2aB0haKrOx4r
 NZSg==
X-Gm-Message-State: AGi0PuYICwkyo5Zm0FKanD60snZVC0E3JHRd0zWy6clnG3aJy54+TuzS
 GVjKXAV6ce50AxKw8F74ZtOTag==
X-Received: by 2002:a17:90a:bf12:: with SMTP id
 c18mr446165pjs.180.1588275921085; 
 Thu, 30 Apr 2020 12:45:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b9sm506642pfp.12.2020.04.30.12.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:45:20 -0700 (PDT)
Subject: Re: [PATCH 16/36] target/arm: Convert Neon 3-reg-same VMAX/VMIN to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <539479d3-eb53-972d-bdd6-116285c024ab@linaro.org>
Date: Thu, 30 Apr 2020 12:45:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: rmXFrl4bazUW

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon 3-reg-same VMAX and VMIN insns to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 14 ++++++++++++++
>  target/arm/translate.c          | 21 ++-------------------
>  target/arm/neon-dp.decode       |  5 +++++
>  3 files changed, 21 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
