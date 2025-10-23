Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D8FCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 06:34:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBot5-0001tR-NC; Thu, 23 Oct 2025 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBot5-0001tD-0E
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 02:33:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBot2-00010t-Gx
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 02:33:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475c696ab72so2906045e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761201201; x=1761806001; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ff7PfSQ0wkoWpNQv4p5aLpKLKdu8ewPoFgQTZ2hoY8=;
 b=ZDOOKjdLizYar4dlH24/0YBFovMI5Qk4gauofgAvnb5fKq4ykfYbPvriDhhY8S3+GX
 7tpozWWzGrieCY5PziynU6XZDIuQ7eGj3R1Ksb9OewKZez8h4sM+AV8h7hmUEQD0i5Dv
 PxKOZ+Dl8tP9KrHI0KSQE0W35GETKV1mXVhioVrul9ma7FJpTz+zZLrq6D+l9QtAaEqV
 JoYkRNFiEdU7gS8tjWtU7zNT/juUm3HUNkpa+fnF8v5Z9w8k3Zscyf7thFU8lcQyU9Wa
 OzdhAQzAHf2ThuqlzScpgT8o+eVSKG1e9h9kK437LPOhaHwfwvOenatXOMvoROSBNfH5
 1Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761201201; x=1761806001;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ff7PfSQ0wkoWpNQv4p5aLpKLKdu8ewPoFgQTZ2hoY8=;
 b=nwW+fVuZdnQh4GWdl8ZCe3a/bqAD3ScK5KJtoVjHvFog2/7gVkLNyjR2jITOjjsyh7
 VVHkglbzBFfQlLS3CPNU3708gjQtfJ2oS0R79kleWJlIWrh5p3JmTeOmRt9B/X1w7WqR
 xKAlQZa8d7FGdtyseC4JrVWNlWKxU2kLcN/Bx5gOkHgQ5rHZnbc67gCGhYcH3Yf0GVpy
 H82kgOtP/H/jp8wuPhpiWSZ2BjKTAB8+2BGda4IuRshLPJYon69xDhw+S9HvMDtfOc7d
 B8bU+IXKu6BDzKmtnXi4pJDHN/rg0YvpySg9YZlJkuafRWi5IuwKd2WEXdWjVfmwDxBe
 FMsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK6S4jEmjIg19No9yWm2svJdYT5TASFvGR0cBKOPf82jNg9tAVcYxm04F/xfctj0dkGxPYRsup6w==@nongnu.org
X-Gm-Message-State: AOJu0YwwcbZccSjtJInojJpjrchhagjTjlX/C4F6Qr8/LJ067L77cpI0
 gMDoQSfpZW+/9prPQpvd/mOwpWraoRqXEtJdyNWvy2TW9c5/m2e+h+vtf2lR8uGKzK0=
X-Gm-Gg: ASbGncv+4cSJ3Q0G7om0p4LLU4UQfn5JCGNEFL0VefBMM0KtkByazQ7YrDRHLfzMZDk
 uXaiQpoOOxcMS+o44hi2Qh+emNj02RNnEJUpr7pDHLlq8EP0E/QppJvavg3cigslE2HTqTShNqN
 n9TQ5moa2J8dVACLHq9sjKeaWp668kUVSTYF1RsrH6qzml3TMQd6QlHazxujGFUA3goOfbfvr+M
 XkdqueYKLSfcKgc22gzZ0d9KMP+vvrxUnD+VuwHCrFOaA14f9LFU8oMsRHF5fCaWFaNkcWVqn8D
 meKKlBi2a6ocUswx5CBsIkIGFOcZ3y6uiZxIdNFC7K+1ejV/FobS9R+OZJpcVRrQn0YjS3iww9q
 hAodGCuMvZtTceDNvW/yYa0ILkJwd45XtJ12HJM51LweO5YiWPIC8kPvdp5HO65p2SzJIPeAACK
 thFBkxfDvFBi8cYYbuyhK1PObCr2mMS6v/Z0oscLgvD2A=
X-Google-Smtp-Source: AGHT+IGbq5fb4QT+zslQbG5MqZR8ogFfVH4hjbhlhQ6lk6rqp/EFinhN1cNJguTTIBijZ7hLFbrecw==
X-Received: by 2002:a05:600c:1d9b:b0:471:1702:f41c with SMTP id
 5b1f17b1804b1-4711791fa29mr175099395e9.35.1761201201567; 
 Wed, 22 Oct 2025 23:33:21 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496c14a26sm52354695e9.4.2025.10.22.23.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 23:33:20 -0700 (PDT)
Message-ID: <60cd413d-d901-4da7-acb6-c9d47a198c9c@linaro.org>
Date: Thu, 23 Oct 2025 08:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/24] whpx: apic: use non-deprecated APIs to control
 interrupt controller state
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-25-mohamed@unpredictable.fr>
 <2cbd9feb-2c20-46e0-af40-0bd64060dfba@linaro.org>
 <6982BC4E-1F59-47AD-B6E6-9FFF4212C627@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6982BC4E-1F59-47AD-B6E6-9FFF4212C627@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 20/10/25 12:27, Bernhard Beschow wrote:
> 
> 
> Am 16. Oktober 2025 17:15:42 UTC schrieb Pierrick Bouvier <pierrick.bouvier@linaro.org>:
>> On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
>>> WHvGetVirtualProcessorInterruptControllerState2 and
>>> WHvSetVirtualProcessorInterruptControllerState2 are
>>> deprecated since Windows 10 version 2004.
>>>
>>> Use the non-deprecated WHvGetVirtualProcessorState and
>>> WHvSetVirtualProcessorState when available.
>>>
>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>> ---
>>>    include/system/whpx-internal.h |  9 +++++++
>>>    target/i386/whpx/whpx-apic.c   | 46 +++++++++++++++++++++++++---------
>>>    2 files changed, 43 insertions(+), 12 deletions(-)
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Couldn't we merge this patch already until the rest of the series is figured out?

OK if you provide your Tested-by tag (:


