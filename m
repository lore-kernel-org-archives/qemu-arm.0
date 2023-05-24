Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2347922ejb;
        Tue, 23 May 2023 23:26:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VncgY5YFZ+pSX/vcpqxhGvO8vfFmF+mlhh3A6O0Hjepw8Em3tWT1bDXx9RUhHAjhdn5kW
X-Received: by 2002:a05:6214:2aa4:b0:5ef:a772:2731 with SMTP id js4-20020a0562142aa400b005efa7722731mr24609826qvb.11.1684909596201;
        Tue, 23 May 2023 23:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684909596; cv=none;
        d=google.com; s=arc-20160816;
        b=lDAEYK280am1q6rvNiyJRISCMOymnTYrjRTUUbvlHWuL9RZw1VODpME7q5ym8i77a0
         MFPVj6nXGheFubR3We7L/nrXf8N74aYV89YNqmptN3WBFujeo3DypjAdtjuamgKH7vV/
         1XwQo/ojRlBKeQCdokLGai2sAa1rfQBEIZASm/94UaDLup5WPKqY4X11bKbpXbh9DKUD
         vNUWagtsqs60IaxiCJUMyZixalrBWb68L6T2VXNbvFr9LsHz+25uVfbrfdSvJOttjcmM
         x/hDo/yvKfIjj2D9pdiFXXDQAZ7RPen4tkdiU49+XJ0t8kt6wWTIy2rH0GV6uxC8UG/u
         sQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=elfdIz5g/ER+semG3iq1xcjFnlP3a+ECnVFlgtSutmk=;
        b=BU/kHQ6vxB3RgXmsoEFj2lmBE5LEtQogK5w11PsTqG1iejXkD9LNy/8mHQFQVSQmH8
         5BndMpTfHibW6ModtD9PzZbMtZHCX+mCqIFf3aqnPYr21kyAcquH+6d8oN7B7tk/cAzV
         RwQYiJzVZVm7oX4/+r1XAZ0oz80AS7438YCLIvfnzNuA2qOlorJP9zQukLyYa3eHiMco
         WItuPG80bpZZbuWEgiYc3xBYXx3Z2faVDdg43O4gm/AZzzuWf0QbONrb5COg/+1SN1uO
         HLXxo0Lpht0wknc1J4x4WEQWCKMRZJZuEflHe3S60Rlt5Fg/KiLinPtjHNLIl69yw7uD
         88cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8GGuKyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv1-20020a056214262100b0061b6c884bacsi6231973qvb.463.2023.05.23.23.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 23:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h8GGuKyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1hx0-00066O-SO; Wed, 24 May 2023 02:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hwc-0005rj-Qc
 for qemu-arm@nongnu.org; Wed, 24 May 2023 02:25:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1hwX-0006Zy-48
 for qemu-arm@nongnu.org; Wed, 24 May 2023 02:25:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so4619445e9.2
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684909550; x=1687501550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=elfdIz5g/ER+semG3iq1xcjFnlP3a+ECnVFlgtSutmk=;
 b=h8GGuKyd9JNrlRkg6DYHGLuen4mykPzQukHbBFhcYAEbC/tMgw7MdN1dU/6BU9uVQQ
 i3PrpD80QEWJEtCIPllTim9xiD8xzHua/IfTRCSexpdnkT8CKvQAxuV5+ibV3mh32klw
 Hds/85j6g8CoiYUx8jKrd77cZdlsZpzbGAWuOzr+u9hnIG+boLAP3oQUurQnqKFoRkPL
 hLkZaYiUUe0FlCpbzljewfTA2uNHveQJTvBFuMRXEA8rb2KygGxqcTYrjvEInvIGjcoJ
 RSjY5FCIcAodV/Jwfmda0jQd5TtsH7OEHPiaKFv3LqLvz5JjX38T1wtRN7t7vxpNfUuw
 Wt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684909550; x=1687501550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=elfdIz5g/ER+semG3iq1xcjFnlP3a+ECnVFlgtSutmk=;
 b=hDO4QPzzby9adm6VXZ8a36v0PWc9P2weXyvpI71rUbRD58bQ6jK+5ZxKtR3usCEm9h
 bgRz5T+RhtCU7lwWvlt6dsbQyZl+c7hegzXt0Fknuof3Wl6Q5xTsGim7VjgWwnJg38fS
 i9JBFWJWkz8S6si3WJHmAGRikFyPU93i6A9FPYf4FH32H9Bf82agOamga1pNqCdbjI/b
 1Gmp+L12lFrcilhza7yy1uhFidYGgoztETceiEV38/+SHwdYuLP/j8CxXtI8pRTsJk6J
 tsEwXB+LFfrXrTnsvP5JFmbH2YQeQvlGLHcOSWgScRj20nif06mHsDQ7pJek/sZINqf/
 pcbA==
X-Gm-Message-State: AC+VfDxlKtGmiWx/1hcoLeckriDWxg8+9ccqHRXIZPNDDi2MIkgx1QM0
 LdPjAyk9hY2GSFNQf7kd6M7D+w==
X-Received: by 2002:a05:600c:294c:b0:3f5:fa8e:aaa3 with SMTP id
 n12-20020a05600c294c00b003f5fa8eaaa3mr9622554wmd.28.1684909550676; 
 Tue, 23 May 2023 23:25:50 -0700 (PDT)
Received: from [192.168.215.175] (35.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.35]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c028200b003f42cc3262asm1092467wmk.34.2023.05.23.23.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 23:25:50 -0700 (PDT)
Message-ID: <6e05d67f-f5e4-700c-45e4-4c3a541c02c9@linaro.org>
Date: Wed, 24 May 2023 08:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] arm/Kconfig: Make TCG dependence explicit
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230523180525.29994-1-farosas@suse.de>
 <20230523180525.29994-4-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523180525.29994-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jzZqxVgHpK3M

On 23/5/23 20:05, Fabiano Rosas wrote:
> Replace the 'default y if TCG' pattern with 'default y; depends on
> TCG'.
> 
> That makes explict that there is a dependence on TCG and enabling
> these CONFIGs via .mak files without TCG present will fail earlier.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 123 ++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 82 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

