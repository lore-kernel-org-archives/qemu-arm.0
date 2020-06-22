Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3351796lfm;
        Mon, 22 Jun 2020 09:48:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZwqpKk2flhqMVlSwAgEUIddmU8guF1sDTVAkIfGoigHpAABVc3ghD06zjQw808wp7/DC9
X-Received: by 2002:a25:4f08:: with SMTP id d8mr31121576ybb.125.1592844507709;
        Mon, 22 Jun 2020 09:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592844507; cv=none;
        d=google.com; s=arc-20160816;
        b=WvI8ByX3vkAjTYmdzD+0+TWiEbfFyefeSvr/TxVnM9h6G9qxW4vkw7nlJ8iKFR/eE+
         QS/25mGdgm+Gt9HgA7u5M8QOHfYtDud5Iu1G1x5I0940rDwOf/mIufq2aGNOFe9Gs0TC
         gmbI4NeknOemqy0viNIWDdIt6GYTg5E+Z/bp1ctwgfta8jwmwkuKJqzZuSqyQeVmQZ8s
         1tbzTarlRN1JpZMxLwl2B0EPA3+xz8tplJYnGfPB+0rgZNJuOcd544qZyPkOamZ5Jher
         oKGtGMi5+xQzTiHOUqr2BFmfrN4m4Ii24EyzXjdujWw/++Ds+Dg3osgimaBBMF2+uqPb
         w7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=chQukggTmBstdzLo3UKBwExa9l0BhvgfjiYmy6JIZfU=;
        b=RgqgYuRzFwRQMt9Ye1wiNZw7OI9Y8Ns+5ILS8Q0zbnQKlsNRG6rRNC+0DSQdB87a9i
         Gr3rW0Hni3Vu4aci93Je5R4uhL11FpZnxWU3PQ6R/Vvoj0VlXydmoJBKszeeZSoIeO0N
         El4wl4HLQnwHjaeW1baVh+FmVkIcgNbI5WL7xQcviPDMmB4ZqCScKPkcYAoG2LtV1Pif
         LzPz4+mrOcNNxO0FTAQnDxlGy1ITsIqpAyVeQ6cQXdMSRDfdSqxPHkQNKhVB/bdxzjT0
         obIJOMKtMg0a/vJjoLoBvkQqkfR60YB1l+/thHxOI5b2a9ZEz5yF2dc2I0nraX70Eogi
         o00Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HaaET52v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t34si14059306ybt.276.2020.06.22.09.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 09:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HaaET52v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnPcR-0004zu-1w
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 12:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnPcG-0004yV-Dq
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 12:48:16 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnPcE-0000DE-Jh
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 12:48:15 -0400
Received: by mail-pf1-x442.google.com with SMTP id j12so6428635pfn.10
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=chQukggTmBstdzLo3UKBwExa9l0BhvgfjiYmy6JIZfU=;
 b=HaaET52vjWBIDH9iY7y2TUFZYmFNAc5N+TBtCuRqOhVkhiJrVaXojOiTA0HVPhqlUI
 fCW7Yi02jeGoghDCCwL1WbOX0R9HOK/UsLL8RQ94eURYMzDjb/bes7LMbGZK7yT1xO5T
 hMuVkX+TQnWpZfqLVYaO8HoNEeDQPsjB3r1KLzXV5a+sTCFfKCvM91n6cQA978u3AJEH
 zzE2cfD9J0MQZNN+z5yK2QoAUtzU5AeTrgFwZ+x+fAA3hIkayjMHSSRKpDQnSYcVkv2N
 QzYRAnB0f3d7VuELBEfQiAUINhgfVrjIzCVXjdpcbrEon7krV+ofUQljRYTs/lY8sXv9
 n+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=chQukggTmBstdzLo3UKBwExa9l0BhvgfjiYmy6JIZfU=;
 b=XgepgNd7hrrgSgZDLpeDHWLxPX5BrowWYtN/3I1c0VWAe79RuQjX+NMkB6A3D1ZQTy
 Y9ubDgufyX2HEjZC40RErHMiJzKkgfNtAXwFnm9uAzEDehfPa2uwWBtpwzbxG/i5f1fp
 IitXJCesK3fk+IAS9AoOssDZAWYl21NvMSHNHDk5WynT8ihGAcuqCoBR5ga8EbJvx3Ri
 Mz0jLx7IugEkKhdsBmCPoeRWbKLf1KqrwG6ASKQuoYoab2+dFSdHTYNU34fOOS5Q/a83
 2KbOt6Yl3gGV2UoDoMeR244/OGZhDSB8d03aePZ2r0VQqbiHB8Z3f8qdoKgVyrMpGnJK
 Do1g==
X-Gm-Message-State: AOAM530CZWcuqUrrT/Ybud5G4akNxnJJ33JpJAcVnvxsLTgpYrgnky9V
 jHBT5Ukph8JSIZiGQkJhJNpCFQ==
X-Received: by 2002:a63:ff54:: with SMTP id s20mr14239378pgk.251.1592844492393; 
 Mon, 22 Jun 2020 09:48:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f191sm14016103pfa.82.2020.06.22.09.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 09:48:11 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] hw/misc/led: Emit a trace event when LED intensity
 has changed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-4-f4bug@amsat.org>
 <ae4a7411-7042-3530-3faf-e25368080820@linaro.org>
 <c9e3897b-c711-f59b-d400-0bd01fd320b5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <191eaa28-7ff4-38f6-9489-612ac984f20f@linaro.org>
Date: Mon, 22 Jun 2020 09:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c9e3897b-c711-f59b-d400-0bd01fd320b5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iq7n1JFbH+JT

On 6/21/20 3:25 PM, Philippe Mathieu-Daudé wrote:
> Anyway I switched to a percent value. What is better to hold
> it, an 'unsigned' or 'uint8_t' type?

Might as well use unsigned; you'll not be saving space with uint8_t.


r~
