Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9FEE63F3F
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 17:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs2NX-00051e-2Q; Mon, 16 Feb 2026 12:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vs2NV-00051A-W0
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 12:27:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vs2NU-0002Fn-Dr
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 12:27:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so2918234f8f.0
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 09:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771262839; x=1771867639; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3rcyPrs+aV9M5Xoa68if9h3UwuyV+iTY5WKkC8mTYRs=;
 b=G1dUQbbyYxmKMll7piZk8HeR8v+plVng038rU87wwpN73Ukb4OWSyhtrLuACbG8X3J
 IFgcroTWVpWF7REjjqomJZarpvnpXZguNmj0A3RS40dpG8ceQFROPtSuhkvIgpAa+iOu
 v+TgKsuwBictPwL3CL5Cd8gQe9sNwjCOCgvP7tf1nm1lkwRWoEDB1vOtHvsiKuzhejQk
 O2tw0T4uk8F6dAUjT4NhZYy5zlpwLbObnIm+QngyBgzBKRXgtwjfbW1yIKIAmA3H2G5M
 wS0/dudfo/oJV9iVy7inQJ6N+foyTk/CcFbk9uspWoGEA8KgT/6Wg2AKEr/jCEbgmmzB
 wmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771262839; x=1771867639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rcyPrs+aV9M5Xoa68if9h3UwuyV+iTY5WKkC8mTYRs=;
 b=VGKYgge5hjaAw1qFzbvoylpf9kP40qqocYyZLjajAPdVKVhFPnzJYqondo+Au0kfFp
 laJcYyQxmxoEKmQunLyRr1JYcOJiDseab8DKnK2WRgsROnaz7HMaaVMfcr+J9aLml2yJ
 +5pClZ5zq+1EyeVLUE8HkFgBWLBXxBGk5v9cXmfIqKqduYPwZnOVr3qIXhkmU4IMDXEr
 yQiktm7yf5P9Qpu/2ioIX2XA0jvx+7jZlK8V1No8vyFY/u+uPJmVx8bSP3E0v+tTWE1p
 JVCKNJebZzJcsZ+k1mQD/pzhlDQtoZLI8xEQdf0A2Q0Pdtck25L4HnkJLw0WDwIsoG7Q
 jgdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnj2OEWKmvsMOjXwL/nHdfBOY4hW/bFWrkXcLCaIw7Ck6FY9aWoECDGy+aLvDgQBl6STuOgop7iA==@nongnu.org
X-Gm-Message-State: AOJu0Ywpn8hHi/8QBGoOJ23QbuNdyp2X6NlSqMnZCjeXmIGjxSLTJxgl
 ZMzJbK7Mso4UyDm/eb+9g6RQhEO1WiBTQLyyprYpbCMKXYD6Zc6PJc7+Syv50iP5oXs=
X-Gm-Gg: AZuq6aK+vm6UNywRc8gFWG66YcwtO+eH899KqPHqW9j87PMNG0KBCXqcdTRr2uxkuiw
 WuJXdcbgfgv1e7xovod4SwQ2dUTmr+9nhIiXhoApNbl4CXSX0TqXg7oJuOgQtz0Z6BtJGcJFZuv
 BOtU9xUqwxQuGk9o52Fe3TtUNmidTHar4anEZd92P/e7pbKnNm0goNxu1nN6tnnC54Ickh39Avz
 anV5vnuu22GKmque0/9OfJEghvCuBQOdaBX/3/LuztFrF+VvGUBapBuiJvy4ZuU0TI4zBUkwXvR
 ZUBpqhjvgq6nTUCoYlZHsnDjHu9P0LxNA443xG7sZ4lkgqGp9qHRtCddJbR7/RRHeGh7DejNaa0
 PLDsU8Er2falNml6G0qkTeMZ/bMWdg7d6Jq4mdqrXxSuaXbIFE4pBOQDVWQqBwG7wv3ChKinKZ/
 sqUcAHRoasyMxynsK+BvlZk+o62ZyX7v60pwVOZB/yn+zqBxOuzI2i+WR5RG7Dj/zz2Q==
X-Received: by 2002:a05:6000:2c10:b0:436:3267:3ed8 with SMTP id
 ffacd0b85a97d-437978dc524mr22410284f8f.24.1771262838705; 
 Mon, 16 Feb 2026 09:27:18 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm22954330f8f.15.2026.02.16.09.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 09:27:17 -0800 (PST)
Message-ID: <0a13bd58-b078-4e1d-a4d3-c199bac1e2b0@linaro.org>
Date: Mon, 16 Feb 2026 18:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] whpx: common, i386, arm: rework state levels
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Bernhard Beschow <shentey@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Magnus Kulke <magnuskulke@linux.microsoft.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Zhao Liu <zhao1.liu@intel.com>
References: <20260215052225.22513-1-mohamed@unpredictable.fr>
 <20260215052225.22513-14-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260215052225.22513-14-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 15/2/26 06:22, Mohamed Mediouni wrote:
> Change state levels from a set of ifdefs to an enum.
> Make register state loads use state levels too.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c        |  8 ++++----
>   include/system/whpx-accel-ops.h | 16 ++++++++++------
>   include/system/whpx-all.h       |  6 ++++--
>   target/arm/whpx/whpx-all.c      |  8 ++++----
>   target/i386/whpx/whpx-all.c     | 16 ++++++++--------
>   5 files changed, 30 insertions(+), 24 deletions(-)

Thank you :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

