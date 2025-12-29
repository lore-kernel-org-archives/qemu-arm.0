Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF27E92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:53:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHQy-0005IF-E8; Mon, 29 Dec 2025 12:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHQp-00058O-Rg
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:24 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHQo-00044R-B0
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:53:23 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-803474aaa8bso3194873b3a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030801; x=1767635601; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKebTEGsUkLdh5Qjx0PteMTKZhXxL5LjtYOii44DHnI=;
 b=gpPoV0t5psdphr/lu2+Ol2jcJVB9YANLr6C/N/EWIVBTlSA6mhqxLhZRMnohPpfGxE
 8OnzJ0+CvVhUOIPqug4QfYguseCxG11XdIfnVsMG5PPx5uMvXbxg3/lWEazurNTseUFg
 yAk/IFu6nYdqcXcKDCdPbgEXw+PPnXfng8PDQsd78Od6TInf4HEZpO6p8e2s/fgtg4+Z
 qwvlOlqKpH0mwTdDQzZK44+fuN1qlkshKAqnYMJh0UU+ThEVtTA/YTMFzdUAkOPiylBn
 R5QUuxY34YOyflq4yz6K2of1td7BfNebgGtbx4GVY0o4K3zevWwg6/OhFEM89s4Rxmx+
 k3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030801; x=1767635601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKebTEGsUkLdh5Qjx0PteMTKZhXxL5LjtYOii44DHnI=;
 b=flY1FURcT7XW6fH9sowWGrs79Y54SGw1GI9oEKzr7F4Sm08ai84I467XSu0a27wA94
 nwIJWvGqgiB2w4iFqey3GQMaK1Cprwb6BEALaUOV0j6ZoB3k4V8vbi/3otjd0IX0/46/
 ptMw1PF+PB0oHUQpjMR6jT31Jkv45rnGV2ydcL+8gHC89bPauGVUwjY9XtsqCFib6FW6
 95VcASaQgn3i6dLKYun4rcetgMo+jd1jM9iMUVfIlKFgy7vmdK1DdncnCFQ7GHcnJyj3
 UToofffyhDgjFcra5eIGsWHcA1wCI5x1sDcp1dTqUbn2hPXdy+ZmA38LbZT8tfFhv+N+
 GSIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp1URlLkoH1jyWIpBnpwzrNU/RocKwB0LZ6RbiL2xN8fWDF1NYw9J28vtpBzxfzqXK7GeeYA/WnA==@nongnu.org
X-Gm-Message-State: AOJu0YyeXlnGj9mqj+AQUVQR2QjK4yAHe+/h9+nRMnnC1s/w2piqK4Ps
 Ei9x3g9EKwm7ya+Jp2v6THa/LS/cHyfRzPsW0jHyIKWM4e8PetM79Co0TunQRLAvcta+M8cXgON
 RdSYF
X-Gm-Gg: AY/fxX6vnC/Hlknah13KIY/m+olgvfceR0pnyXjxOrXbJRRGLR/ROBZyrAXWe+UeZpg
 Z7Qo7VAlEcfz32bssMFZFKyhTWYeRrmClsjJIJEWy4iRYFNzav1TQfyeL4Da+o2stgdRhzTROj2
 +lLOcCh4p8uJnmQgBvcOTOarVjhyOB5ICCd9E45GUTO0MahNDHlMcOgehQVtjvfRmNKk5S/qYxF
 iO0dQxa4Gy/iSaQEP/FyyFXQsPcubAVfNbofBg3kkZj0VJl4TzRiNr24j/DQ9yL4aBGFxLbZGW/
 TBKrtFoFrkQ5p4lfzC/N1jY0bIsqRo3CnU50Fc18NSTnhwqeEjTWRHCe5f5jZQ+DegbtXqZ+5/f
 fSZjmWHm+ZoY4Hm8H8S7sw65RDcq8Bi9s1C6b6VLuS92yuqk8D8rFwafTfP1kAqjWefR18WYFtQ
 BfSmbBtm0hGKhWc7YRDAVEpn9Jpkv8XyRMicGxm4qbCNBWbqW3gdYOy9stLjRgEmsOBN8=
X-Google-Smtp-Source: AGHT+IGVgzQAK/fKu5u3+Z3UqeiiRUCzfsX+fcyo5nUsypedfjWctOq/0yYO4IO5xKpzh8UtaIWt0g==
X-Received: by 2002:a05:6a20:7346:b0:36a:dbc6:2592 with SMTP id
 adf61e73a8af0-3769f928fb7mr31412985637.31.1767030800854; 
 Mon, 29 Dec 2025 09:53:20 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e79a164d0sm25942432a12.10.2025.12.29.09.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:53:20 -0800 (PST)
Message-ID: <67b6e092-f03c-4638-a72b-6871958fe31f@linaro.org>
Date: Mon, 29 Dec 2025 09:53:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/28] hw: arm: virt-acpi-build: add temporary hack to
 match existing behavior
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
 <20251228235422.30383-9-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-9-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> In the prior Qemu ACPI table handling, GICv2 configurations
> had vms->its=1... That's broken.
> 
> Match that assumption to match the existing ACPI tables that
> have been shipping for quite a while.
> 
> And see what to do for older releases. Likely don't
> want this to be carried around indefinitely.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt-acpi-build.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


