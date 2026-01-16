Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12648C9830B
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 22:50:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgsdQ-0004GN-DD; Fri, 16 Jan 2026 17:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgsdK-0004EX-66
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 17:49:35 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vgsdH-0007sk-PG
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 17:49:33 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so1205874b3a.2
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 14:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768603770; x=1769208570; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FdpCekvKZL83qWf+bMVR8A5GN7sZrhO6Z8RZXKo7LBU=;
 b=JW60uIVGKSsp98wzfuWEwRKTbrjAVnkk4XWrncvG8BMWEyNypGuoeoU4ezPWXmN/2f
 l4BnS5r3jcz2r28g6imCeJPEo++H0BwstB0Hk4BNLEDQVhDjdLt6Fr+QS1BePiM/KHwC
 pSvTUhLv4hzk3kwUfnJz76zLUfCWOkUcWoPta6aYsq95/BztumQm9cy3DoLVN7sodwBd
 ewSa8IGbN1Mj4g0Yx2wBAfxU5nZYOYZbKAIz+k56q6qWnfd/VNjExjNmNNze803Vi33D
 /zOrRGuZg/cTS9+vz50sP1LbjFdS2QDvOSckp5ZuFPubZsgJifca1ywxZ2sopJ20Y3ry
 UHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768603770; x=1769208570;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdpCekvKZL83qWf+bMVR8A5GN7sZrhO6Z8RZXKo7LBU=;
 b=KB2velNxJ1dK4KiO0pQuFeZxCUfqh4V7clfCqDrqL+4tINmYYv2yxWEehEvVYytlIb
 MnPILH9LggOSK3CwbvLjt/ubXwsqlaMWYAqr5b8cqAvH6Jf4kUJn0lE7VjdDyfSvBsah
 ybp4LuufSx5pSje8nWDseWjAlu/zLCc8XMrIs6zb9Arno4b3inN0dGcCF2HwgxTU/m+r
 nosTik7CyLpTUXIwh2tFyNuGjsJDuYA+qDyvDTXlttu89Co18kJ+QRIladS27rTDoRSV
 gwa1pj+uWVrHqW9YoKNYRlUzLvxSaBj9nHoUXTv2Fsw6lB0ci3jplAL5yGGtWMMxY+xq
 UaxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGYKz+yMn6vELh8kuavxj7spN0A98EWx6p4TKvqpkqKfJYX6l+hy4Nf4RqzBjhfY7/6vj4/wTMBQ==@nongnu.org
X-Gm-Message-State: AOJu0YwlfGbM2oCUzHU09FpOAkVIaxC4BetaJRdY5UGOBcndfkmfCP4G
 Ar53YPsPZHoFnPmlfWU6Y216XAsVcq9Zc1S98/nmh3YVEUL90XWdBO43IJ3wHFjE0aQ=
X-Gm-Gg: AY/fxX5USeCOa+GVcajaW2seV4E9WLPZ1+xWgsX8FYro+Kvh3JxKvkLytC6GxNWLsiV
 W7mMArgIAPwKva0kbc9Oc7MttcArMKeWZ5gQ7FAMEP5ff6yVQcmT8L9ZOubO2zHqQjLbP3yOI3R
 PIYJqHV6NQgiA57g7HlNrASiReXc0RBGcmAFZFi9HPYWp0aFv+6nkDE1T1puzgFf+UgOtTbTXX6
 s81yvqF1qb5bzEmDXEfIu3x6X9T86xmu/QANwZcDjJOWwaFJ+D9xX77CwxmfaayxedTsvX1sMe4
 jUWEvZkB8yd+DzgcT/fpmqylJTV1zoneUTjjzEo4yOOC7Tpnv2euxaa5nN5IhiFimEnpSqIQ2rO
 s4H+OS52r+JTdeBzQop9kowZTeHjeRZJ3uj3ltMmyOc2H0+ZZQ14mV86i6VVCaQPhHOFLb5SSNC
 FFHwpEUaYsF8Wp5oFYaOKkTY77UNo0EgX6GCGmJUK1aUjf64ixulrfBpVu
X-Received: by 2002:a05:6a21:a34a:b0:35d:53dc:cb57 with SMTP id
 adf61e73a8af0-38dfe76d344mr4583788637.49.1768603770211; 
 Fri, 16 Jan 2026 14:49:30 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf354b3asm2836870a12.24.2026.01.16.14.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 14:49:29 -0800 (PST)
Message-ID: <7e8d19cb-723d-4d5c-821e-6ad25649c867@linaro.org>
Date: Fri, 16 Jan 2026 14:49:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] target/arm: Initialize AS 0 first
Content-Language: en-US
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org
References: <20260116185814.108560-1-gustavo.romero@linaro.org>
 <20260116185814.108560-2-gustavo.romero@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 xsDNBGK9dgwBDACYuRpR31LD+BnJ0M4b5YnPZKbj+gyu82IDN0MeMf2PGf1sux+1O2ryzmnA
 eOiRCUY9l7IbtPYPHN5YVx+7W3vo6v89I7mL940oYAW8loPZRSMbyCiUeSoiN4gWPXetoNBg
 CJmXbVYQgL5e6rsXoMlwFWuGrBY3Ig8YhEqpuYDkRXj2idO11CiDBT/b8A2aGixnpWV/s+AD
 gUyEVjHU6Z8UervvuNKlRUNE0rUfc502Sa8Azdyda8a7MAyrbA/OI0UnSL1m+pXXCxOxCvtU
 qOlipoCOycBjpLlzjj1xxRci+ssiZeOhxdejILf5LO1gXf6pP+ROdW4ySp9L3dAWnNDcnj6U
 2voYk7/RpRUTpecvkxnwiOoiIQ7BatjkssFy+0sZOYNbOmoqU/Gq+LeFqFYKDV8gNmAoxBvk
 L6EtXUNfTBjiMHyjA/HMMq27Ja3/Y73xlFpTVp7byQoTwF4p1uZOOXjFzqIyW25GvEekDRF8
 IpYd6/BomxHzvMZ2sQ/VXaMAEQEAAc0uUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91
 dmllckBsaW5hcm8ub3JnPsLBDgQTAQoAOBYhBGa5lOyhT38uWroIH3+QVA0KHNAPBQJivXYM
 AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH+QVA0KHNAPX58L/1DYzrEO4TU9ZhJE
 tKcw/+mCZrzHxPNlQtENJ5NULAJWVaJ/8kRQ3Et5hQYhYDKK+3I+0Tl/tYuUeKNV74dFE7mv
 PmikCXBGN5hv5povhinZ9T14S2xkMgym2T3DbkeaYFSmu8Z89jm/AQVt3ZDRjV6vrVfvVW0L
 F6wPJSOLIvKjOc8/+NXrKLrV/YTEi2R1ovIPXcK7NP6tvzAEgh76kW34AHtroC7GFQKu/aAn
 HnL7XrvNvByjpa636jIM9ij43LpLXjIQk3bwHeoHebkmgzFef+lZafzD+oSNNLoYkuWfoL2l
 CR1mifjh7eybmVx7hfhj3GCmRu9o1x59nct06E3ri8/eY52l/XaWGGuKz1bbCd3xa6NxuzDM
 UZU+b0PxHyg9tvASaVWKZ5SsQ5Lf9Gw6WKEhnyTR8Msnh8kMkE7+QWNDmjr0xqB+k/xMlVLE
 uI9Pmq/RApQkW0Q96lTa1Z/UKPm69BMVnUvHv6u3n0tRCDOHTUKHXp/9h5CH3xawms7AzQRi
 vXYMAQwAwXUyTS/Vgq3M9F+9r6XGwbak6D7sJB3ZSG/ZQe5ByCnH9ZSIFqjMnxr4GZUzgBAj
 FWMSVlseSninYe7MoH15T4QXi0gMmKsU40ckXLG/EW/mXRlLd8NOTZj8lULPwg/lQNAnc7GN
 I4uZoaXmYSc4eI7+gUWTqAHmESHYFjilweyuxcvXhIKez7EXnwaakHMAOzNHIdcGGs8NFh44
 oPh93uIr65EUDNxf0fDjnvu92ujf0rUKGxXJx9BrcYJzr7FliQvprlHaRKjahuwLYfZK6Ma6
 TCU40GsDxbGjR5w/UeOgjpb4SVU99Nol/W9C2aZ7e//2f9APVuzY8USAGWnu3eBJcJB+o9ck
 y2bSJ5gmGT96r88RtH/E1460QxF0GGWZcDzZ6SEKkvGSCYueUMzAAqJz9JSirc76E/JoHXYI
 /FWKgFcC4HRQpZ5ThvyAoj9nTIPI4DwqoaFOdulyYAxcbNmcGAFAsl0jJYJ5Mcm2qfQwNiiW
 YnqdwQzVfhwaAcPVABEBAAHCwPYEGAEKACAWIQRmuZTsoU9/Llq6CB9/kFQNChzQDwUCYr12
 DAIbDAAKCRB/kFQNChzQD/XaC/9MnvmPi8keFJggOg28v+r42P7UQtQ9D3LJMgj3OTzBN2as
 v20Ju09/rj+gx3u7XofHBUj6BsOLVCWjIX52hcEEg+Bzo3uPZ3apYtIgqfjrn/fPB0bCVIbi
 0hAw6W7Ygt+T1Wuak/EV0KS/If309W4b/DiI+fkQpZhCiLUK7DrA97xA1OT1bJJYkC3y4seo
 0VHOnZTpnOyZ+8Ejs6gcMiEboFHEEt9P+3mrlVJL/cHpGRtg0ZKJ4QC8UmCE3arzv7KCAc+2
 dRDWiCoRovqXGE2PdAW8788qH5DEXnwfzDhnCQ9Eot0Eyi41d4PWI8TWZFi9KzGXJO82O9gW
 5SYuJaKzCAgNeAy3gUVUUPrUsul1oe2PeWMFUhWKrqko0/Qo4HkwTZY6S16drTMncoUahSAl
 X4Z3BbSPXPq0v1JJBYNBL9qmjULEX+NbtRd3v0OfB5L49sSAC2zIO8S9Cufiibqx3mxZTaJ1
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260116185814.108560-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/16/26 10:58 AM, Gustavo Romero wrote:
> Move the initialization of AS of index 0 (ARMASIdx_NS) so it happens
> before the initialization of the other address spaces. This is purely a
> code organization change with no effect on behavior.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

