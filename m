Received: by 2002:a17:906:3a98:b0:8ec:972f:f46a with SMTP id y24csp19093ejd;
        Wed, 22 Feb 2023 10:44:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/7PUiuk4eSeXjTPAYVEvPb5dLyKkH8WKtQW/m75CZScp1xQDMhGGABP7shF+Je06CJM2fN
X-Received: by 2002:ac8:7f84:0:b0:3b9:bdb0:7aa1 with SMTP id z4-20020ac87f84000000b003b9bdb07aa1mr16590447qtj.41.1677091455032;
        Wed, 22 Feb 2023 10:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677091455; cv=none;
        d=google.com; s=arc-20160816;
        b=W4JxQAG2+N2+aQLGLIl67l2QGKVqkYzxrGweHifU/nxwr7VRg4190dZH6KH8d9AyvC
         CasN9aE0B4So+/oUe63Mi7lQ07kJCXMqUT4ukZJ+8BFDEzkZiRiQCqqTIYeomgHPOgHb
         9VxhhCxNsfI1mjnMTkjqdzDqApqvgD+RklAW5HyI7uRp46TMBNmkxSSntjp710bdpW/b
         qxaB0CbMT2d7X6BDAzIVFXcGYcu3TynGmBA/CXsl+ALNL9YM6xP22OOWWw5NRV9WsfTg
         OlLT08v0PtvnpHrO8Bx6wDX/+wGhw20VNRlJJYlKNiKmDz2vOf8PDcmSrtoTR6lDnLfY
         P2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FQJWtbYOI9grQLhgUeD3DxukusUMNwfujnH0TQwA/M4=;
        b=EzCkRihq27hp6+MLirtIc5CIO7TBHT14P07FYYKlzOZDaxbppFCXXms0oVxZPaSRtT
         XSrVwULxoIGHTtAm/HiH7yHwrRHjza20/3IIgsUvbywd0Zb8oZ3D5F5RdFXNdacTiSzw
         CPbWxSmukxoj6WGOQRAwYQCn5vH1nNSALw7GZKKUyFSr/qcW+4OWBqbfKqHex0btkLfW
         zAeXARmwQmrg/yGLAlJmX8AI9CQBeFN9JK/husz8fY9ccX5Yev5CF/BziJ/NNiDy1dfJ
         VEQ2v8F+pKAzRzNZwE/ElXMlrxjhtmbl3urwWgcZVj/qqoK3wbZGGxxSdAGvSI+ZYZYC
         +JcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5wjdpIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85d93000000b003b86c95a9d1si2257911qtx.346.2023.02.22.10.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 10:44:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5wjdpIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUu5m-0005C9-Vn; Wed, 22 Feb 2023 13:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUu5j-00055s-FF
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 13:43:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUu5g-0007n0-KX
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 13:43:47 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so1773372pjb.3
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQJWtbYOI9grQLhgUeD3DxukusUMNwfujnH0TQwA/M4=;
 b=U5wjdpISSonGsu6d4yPC6/ASnmfB2rT2igjCk41IgnUVaKah6LYgfhtOQranD7oz2F
 JBMTx/7H5YyWeDCEclRQP8beYmnWbjR3IgQLqYsmoYnf2CRWT4PTzsXokplBg4mp9yGa
 KjN5xOQgI9C1hM6p9yLhJqIuzWGR1j1dIq/+zt5jscnd2el2AY7GzvNzUZ3nW7n0Rcz8
 WoFrPNNzS0RWnlsiV4ckuwOb53tkE6BviMFu4XWgPRx4AwgX0uiWcitUFC75rgw/2U6t
 El8hB+33n28gXhHPwf7d/IUhZi+pn/LW0ATf7NkJUkjdiT0hMrLKUl545WGEt+H7Vfd/
 FK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQJWtbYOI9grQLhgUeD3DxukusUMNwfujnH0TQwA/M4=;
 b=Dkxc3MfEHYEY9ExlwtPgmPKg0HbZbd7NKCM/igJKh+Jx/CsmYn1Pq683CRAp3mN1Sj
 cIg+MoMYgo5jynYGJvJv1HJdrf9ezOfBjymXJIh9FwH+LHY0scsOMJ0q1K89gecCylGM
 grMnL/THVb5JiOrkNrLxKzeTu5XzWMPqEVGjrCF6wp4/cpya6RHGyd62cCuLyO6RkjYc
 /YfCBUJiVp2qhP6gyTQ0SH8iJ7LhDYJadSXanSffiD4CuMg4MDQ7V13YSHTWPbmVRKDj
 +whuMoBoZdheJjiRw8EcmKeVG01IWuE5yW6GzROC2ROCJiesFjsePEWDWtCo6bW31NAj
 yGYg==
X-Gm-Message-State: AO0yUKVnZDEZQa5yd/g9HsvpfGyy0nl0Od99eS0KSSNt7Y7Y9D0Gw7az
 URGjR4MZI4V4TeMwZ0Qr8JyZPg==
X-Received: by 2002:a17:902:c408:b0:19a:90ed:af6f with SMTP id
 k8-20020a170902c40800b0019a90edaf6fmr12529469plk.60.1677091422898; 
 Wed, 22 Feb 2023 10:43:42 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b00186b69157ecsm1297922pll.202.2023.02.22.10.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:43:42 -0800 (PST)
Message-ID: <275ea039-aec1-8c81-6267-4a77208840f0@linaro.org>
Date: Wed, 22 Feb 2023 08:43:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
 <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
 <20230222112755-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222112755-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IQTiaasBt6FS

On 2/22/23 06:28, Michael S. Tsirkin wrote:
> On Wed, Feb 22, 2023 at 05:11:36PM +0100, Philippe Mathieu-Daudé wrote:
>> On 22/2/23 13:05, Michael S. Tsirkin wrote:
>>> On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
>>>> Since commit 262a69f428 ("osdep.h: Prohibit disabling
>>>> assert() in supported builds") 'NDEBUG' can not be defined.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> this exactly says NDEBUG is not allowed. why are you removing this?
>>
>> The project can not be built with NDEBUG. There is no point in
>> mentioning it in each individual function.
> 
> the reason we mention it is because there are security implications
> if we don't.

Yes.  However that's not what the text being removed suggests:

>>>> -     * This is just one thing (there are probably more) that must be
>>>> -     * fixed before we can allow NDEBUG compilation.

This suggests that we *will* allow NDEBUG, once a few things are fixed.

I strongly approve of this text being removed.


r~

