Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2736731lfc;
        Sat, 5 Sep 2020 20:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC/TzU7U4M9xWJw4Kri0w9OPwcCPof1Wuj32DT/xj5oM9rSmAfNU0IoGN5aDGRvkRQys/Q
X-Received: by 2002:a25:743:: with SMTP id 64mr5631733ybh.134.1599364711028;
        Sat, 05 Sep 2020 20:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364711; cv=none;
        d=google.com; s=arc-20160816;
        b=tnvQLczNyee4Rp+AH3Z5Ee7DHYqwfrmNdEUoAKsDTaI3BcA341Fr21ETOqlqfqwZr9
         ityo6K9e09k8oV25oK5Elw9sbXbrbrGbpmANIa+RnVQFkA0wbKugNB0xQz3v5fbYlT89
         dkGHyOratD/Qo6awp+xQ6wZeXmywxP/8bqFMM98vfK4BU4EuN3S+xDd9cx503JpnaaLn
         xwlz5J0nDG/KkciromoihB8E2X9w2CoTPWAKwM925Q/rlfAnwnFzQ1chOdydc8xLZExV
         7IVONEIvnPfB0oUHPm+xPH60b16wK/fTQDbvmxyTmUl31DKngYZMgSLuUbGK+qa33Oev
         H1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x/K9DfBaCDVRy2Q1yPT5gqpEh6i01VW8hIjOC6nepkc=;
        b=tWZ+JaTgbCgvZDFQc5BK4zRghp4gSRzKqi6LL68+omzYl6E4w8+9ULeCflsPvdowFF
         ZqXSkWAKiJKRO+62PcyB9LT4pK61Xz4RuzayUmZIZdzRGpsFC1Vj5jcZSu4JXBPRWG6y
         h/gFhMiztLKqNbxix/mNEyIsFE5OlxuVEKqzK4W6Gx7faj0c+MvOBiC8BNNNXmeY+b7v
         FIkun8r721jAPX0sg9TswNJQmTxbcFtD7t0HCxtmYn7CRnxp0a47VaSRb8eZNZzamVEZ
         gGP5MRko22a8hZNMw3IpPJ3TjNfW+EmeNjOxmSruUkNwxKYObWl9zICXH9Nu21TNS721
         XGow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="a0TCaUF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d36si12876357ybe.81.2020.09.05.20.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 20:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="a0TCaUF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElp0-0006BQ-El
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 23:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElor-00068f-Qw
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:58:21 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEloo-0004tv-Vc
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:58:21 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kk9so2470176pjb.2
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x/K9DfBaCDVRy2Q1yPT5gqpEh6i01VW8hIjOC6nepkc=;
 b=a0TCaUF/eQ4JdzFJz7r+gYBP1303bQkxWTBNvfEI2osx3xFWMxXjqMej5hWRm1JJJ5
 nCwB71F9dycCGhv3Ir9uJGkUCVBcdTMeJ1WeC4q87YpRozA7Kk8NxGH70g2Sf1tdLW/z
 c0RFZZyP1atoS39U1hfB4DXspghoaBeE1NG9pkzn2O5G9ljmGZYhWJmVUPyK00IlIOHC
 Of8oY+b8kg9LmdRYNCQggO9EhyF7cECsZ87+CIf475eAa/nKNzb/Nx0+C3mA4NwCCqYo
 OLvtTzDK5Z0VxCI9hzntIor8B1NpA0rd3pSGtNmszBazgZTgF3EiXKhOyv13buo/ejhW
 5oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/K9DfBaCDVRy2Q1yPT5gqpEh6i01VW8hIjOC6nepkc=;
 b=giHsYL5W1LhW+tpRFnmwcsJ79RZZ4awCpbYmxQIJEM2YjrmXgemKV4dFBbE77dTxqT
 cqiV+L/7uBDaqXLGpw6oQV0TM/HUyDE51cnNrW+Xa1ICzNkVEm4QbDdbFv6G+RBcoIcg
 qzJyoWbpehhlIBvOskUwLNdk1eNiXVIcEzpyJGM4scBIpsayY0JZGDL+xbwe06BTU5YS
 T7j3M+c7A8Z7LoMYjY6anpKJGenX5BY1tlf8JsTSnL4Np6WBhNUP0vXj4cnzIa6gS84w
 Fk8WRA2bM4Q8KnPqtoFJ9eJRe54dgFgWHRtVXMxnOyTGqShOMIKn+iv+X941lgppoLNf
 RggQ==
X-Gm-Message-State: AOAM532w46vpfmNuiTAfaNgs3Qqfrr5CCyHmLnjFO26a5WAHeMwxK8iD
 aaAdxyuL3RS42HKLJBXQYyYZJQ==
X-Received: by 2002:a17:90a:bf8d:: with SMTP id
 d13mr15219470pjs.100.1599364697731; 
 Sat, 05 Sep 2020 20:58:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u22sm8792077pgi.85.2020.09.05.20.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:58:17 -0700 (PDT)
Subject: Re: [PATCH 06/13] dma: Let dma_memory_read() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f013f669-d7a7-ae06-a192-0878451dd18d@linaro.org>
Date: Sat, 5 Sep 2020 20:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i/ZdViTPmzG0

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> dma_memory_rw_relaxed() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

