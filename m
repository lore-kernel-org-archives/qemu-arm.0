Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A464F513E2
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:18:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyH0y-00013a-2m; Thu, 05 Mar 2026 17:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyH0v-00012D-0u
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:17:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyH0t-0003Xm-Hk
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:17:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48378136adcso51936105e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772749066; x=1773353866; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OaLyXrvU9QJibv9gna6B1ytKmYYtqjM0gR9d6a4SrSM=;
 b=RFRPOyAylGIEAZKpbmeSDC2KBV1kC2LaWTF8pC0tBBLIBkLxk6CPnuA6QwiKmKaXyb
 gEF2kWGZJtpYJICAb0GYpdjmj6nuUGpzpN+zcfwUBJVAVya1oWvql5AFnwPOGl8hFms9
 xhVvLJ/dUyOFzs7ZFjJM7dqK85IH055C0wRk9FAz5BDuNwr+tXapAchrVReGZO58qYd3
 IX2e0NmcBAKQRSRuM/n0Q3ffkM2epZIYinCt3yNqdDvbysYjfUqXlKqDWIMoy5UgwSfX
 8QD+DLBvHKLM+/SzGehEJAJ4OTaercKUBfyj+2Zuv1qfh3SvVTi9faliP2+lTNsclRVT
 gMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772749066; x=1773353866;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OaLyXrvU9QJibv9gna6B1ytKmYYtqjM0gR9d6a4SrSM=;
 b=KkcMSZKXKMMkKTiAKAjKAagPvXvdKxuBqf+3ZDqey5lC+UkRPOynm3z5QVsg5eBtdG
 QaKpNmo5eQkWAVVP2FADp3oJw9nZaxCKqcYXYMoO1d7dGkgjBuLzX18qtL3HnPMkpBk3
 mhl8zQavnIqFkJ9csq1OS29w+oUcFKy/lqU1QxeFm3q4HKcVDfrj/7H3x9vEwq9Z6QiH
 zzUjKMQJmusoEMENTP3Cz8IKwQk5gvdQUl+l9AiUPL0oeMZbnKG2HxZG2QlwQClmkRue
 /pmUn7NdxTulxRjRt7aiEV7VJTT2V0XnI1l7E6fxV5N2KOTQCqDvGmRZz90RhNgqnu8M
 NnTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXzm+fvnjdGteQKmmAM+UYgtuMOMOdDfJBWPOF78PTHr8cCZvHtIatLchH/ZJiRe7D3MJg9yfhgQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy1GtDKhigJM6VFx+pQmOy9L3k73QQHDH044f2HwdOCoM/ygtIH
 8Kcs54YQXgmnKo5jpzP2jOdxv1yCQt3mo8gaCqaTrqd7MI4vPeshapWfphzF9zlJbaHY9FXjtKv
 J3H8nl7Q=
X-Gm-Gg: ATEYQzwXxlfOhpK/lSo7s+Q/A0w+YCLpZqLRV2X6X4yVPtFDZEfczlzGVLW+6DiRn50
 S16/dGqLeBAKc42uzVPeSfcTITZxVeqljULcde/kZ0KIeCQoQJRa/E9ZgxHOlsoh2LAlgDK1FwZ
 KMY7OlKrJPxrkliH1WZrjrqVVJs4Nyfv981xwv3ok2XeYjmj2iV2aFbVnOwecOGc16XQWjBfxTZ
 mVz8bFmjzAk3FLXK4lFQD25tYuXBWDtjgGYBsd1VONnuXGSx/hLLkc6dTAdOTUURClLFVY0/Fd9
 F7dw7gC7ApwbzuptXUU93GknNqHtk69opJ/f5S3KQcNE8woT5f+Zg0IQ6qFEHHZG/abnQe6NbOH
 /dHBzDSNXYK+CqV0DFOBKafvJjEw0aZ5kb12QkQ+WmaYGw4KOBh1TeqwiQU7E5GLazcPRIr5ccB
 WWNeQ4kIS2mVGllYQm+JZSsV9DuEYPlIQ3YvcxWY4VXSEWOSzs2WKNCwrggnI+kYhTGA==
X-Received: by 2002:a05:600c:6291:b0:47e:e20e:bbb0 with SMTP id
 5b1f17b1804b1-48519837bbdmr108780835e9.6.1772749066059; 
 Thu, 05 Mar 2026 14:17:46 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb33815sm140413985e9.12.2026.03.05.14.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 14:17:44 -0800 (PST)
Message-ID: <1e9af00e-b757-4013-8564-a6b414261339@linaro.org>
Date: Thu, 5 Mar 2026 23:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] hw/char/serial: Remove explicit cast from void
 pointer
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260305220911.131508-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 5/3/26 23:09, Bernhard Beschow wrote:
> A void pointer asks for being casted, so C allows for omitting the
> explicit cast. Take advantage of that.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/serial.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

