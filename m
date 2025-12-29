Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E3E92FCA
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:58:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHV7-0001Tb-S0; Mon, 29 Dec 2025 12:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHUs-00012m-ML
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:57:34 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHUr-0005c2-64
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:57:34 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so9207936b3a.2
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767031052; x=1767635852; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Xy+8eSeOzDb+k1YRCc4hfaw3xrtM1K2VyUwOhxg/MY=;
 b=Lc9akelTnEcvd0y9hk8Hdi36QBA3uZrJz+b06Wz9myqssHwXHKezKkm2bJvKpMWM1z
 C6EvoywgIMl/4WkU1geWMYMgEop/Yzk1EOjZpnWbWk3Wd1JejFD9zzaxtH97UMjBaEbv
 0yZbWb6V2TWCBJhgXLos1oJ0w+IBmq2aJOXwcJMuYxAdKohbKhpL5UnSG9WvOLS3LozO
 YQ0ucCxR5TBnG9OBoZi1LgWf0hPIksLd7iW8jTnPvbRQ9KINoEZap+/rf3Luf8ODxRz5
 hlnqwSk4aAWroxhLM0MBX5u5/V3qaSZbf19pl1HPMtbWsLRjNDS1iT4pdgYngnH6JjvB
 iPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767031052; x=1767635852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Xy+8eSeOzDb+k1YRCc4hfaw3xrtM1K2VyUwOhxg/MY=;
 b=XpD/hyKsUU+T4ZbOtDpXPgrD346Mzd/lFFBQ9dGfV2G5IW8V/Y+m+5ksPhvi8QWJHq
 w7UzKsiEbuj39D2P+UZrE3JvqJhv4ywIRlXZpFTP/YuphRDH4hDLxcYwQKBPYjfS97TC
 lXxeGRAQytLHA5ewjT4dhoQwlWwfBIrPyeJ9ii7BF15/Wt16Fo/bTPx5wZyDINKZzBi2
 er4hS5FUKRy2x5OJET5yD46hvKYKK/j04DV3VXoj2buotg5Oczi4WXzeRUSZ+qgaSp8I
 8cRoNW8sWxT7hgzhvyH9jfkunB3tQsxKsTZM8ISlPNtITVHZYqBwNP3rpOaQcl8UzP5E
 JMEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcijPw+FuHP+arpVQf9ovN3Il72zt6xYxa0IMXh18zo6dJb1li1adbhfMquy1sQQm/raV43zlLFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz2ry4oeRSarPebdEqfGK4USndxJ449GZjJgHkcswnuBDYzNyw8
 sJK5LLkj9K7ZzektMze1WvSEtmIA0wmIGEtXzRsZir0SLhDtFn9xp4VX+qiQEDphjX4=
X-Gm-Gg: AY/fxX6F5BQnajfEn4Q8cxwtzRzEDOXVWpWX4ZywsyoyrwSwyEiXDY29To/mFFaOzZZ
 fqJtzGiwFtf/SsF53R6hPkLwcWzjthL6ZJO2VjgJqsRzUSVkeZbdlElfi3+bY58ELfaxhKBsUDG
 fA2+/iIQedM7bXSsAMPsqVtL1d/3dbiOiWmXoAc3bljfMXTD7OVKo5MtwJ4rHCBzCvMiAR/QX0C
 H+h253mYLapuxXGrhp+GdrJeK2SIocfw2NAnHiBwfcheUiz/s1zAsWog9IMiXbE3gkOteQMVKSf
 1IlRLqN3miNtFyPyGlgJW7IovSeqBN0C5jUJU2HPP8TCsg8UjFEbKhQ9EXFX0JIdfa5TBOcvNMP
 k4WVUIKnTJU6yXhqAFdmP9qeuPwHTKem6XiRBtOTyfssI5W6mgv1LWgNxZmcpQVrLDxVnD7+8Xg
 AdBCN1+XQa5p77IMa7GRb2B7mUgPWHX3Zk0gnCYJDpIkRGBx3Hbbsjg0UU
X-Google-Smtp-Source: AGHT+IErFKWWqm+GLSQDAJjT1aQGL+KgN1/3vWXPXUMO/eDX2d0jFCrmaASWq0eJP9PPGU3CkfNm5w==
X-Received: by 2002:a05:6a00:39a1:b0:7ff:9fe7:9811 with SMTP id
 d2e1a72fcca58-7ff9fe7a134mr25809392b3a.31.1767031051602; 
 Mon, 29 Dec 2025 09:57:31 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a843a18sm30285572b3a.14.2025.12.29.09.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:57:31 -0800 (PST)
Message-ID: <3dac03d3-e87e-4ad4-9fad-2c247c10cd12@linaro.org>
Date: Mon, 29 Dec 2025 09:57:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 28/28] MAINTAINERS: update the list of maintained
 files for WHPX
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-29-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-29-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> Add arm64-specific files.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


