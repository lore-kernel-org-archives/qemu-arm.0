Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp295622ejm;
        Thu, 20 Apr 2023 02:20:53 -0700 (PDT)
X-Received: by 2002:adf:cd85:0:b0:2f4:55c3:8452 with SMTP id q5-20020adfcd85000000b002f455c38452mr939353wrj.22.1681982453794;
        Thu, 20 Apr 2023 02:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681982453; cv=none;
        d=google.com; s=arc-20160816;
        b=KFoxcNYiCdjE6IqOXTbyDxlnPmq/R3TvJiRcPcny2VoWostoAaX4NRYEfAjZ3uc76H
         VBPbwEg1+NlSdrDn+pkIn+m0GqZrFyHsyTEV+BSbECVRmUtPr84M5No2FHnqRzLSduxo
         lWknCbhYaLRqNPPw7PVPANtXwUxwE49+N0HV7IBI4XJHbN8Wi5kLkYtKex8vcPeFzfOX
         uB8ehYTO1QW1ErV+PqIOAbtKeuWn6ZGeT54DX4amE6bN51ajg1P8UG2QwOVxIEfP6ZXX
         g1DC2eKI6Lawp0h0Xnzd3LkAbTnRaw3eIh4bf/Q29GKzS9xsfysh/+qpFLuZjqD2BOwd
         Em4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l63fBVqf+skRhDHzj3FMLixVBb4pNQ9am7013dNRv7E=;
        b=s1XWneKj58juvqBgSsBCf5TMZKnyB/zflT/B8tyrByMrz4upflDYAC9RMiCqS9I7SJ
         m1BYjsFk5OPHNQf0kMclbm1FWl2eqgWZs/WtaHP+6PsW9u+w5IQjhvuMRkQ9cSed+cpj
         G5zxBeWeqHIf58+oVNxZ90rPifY8OZnizPyTcViE6SkGaQcsPr6ym7D9O/f7qpjLcubC
         NQBNhq+h4YvJBgUsUVuIrBeY6pZd7FiuixAMmAzQoGviDj3IMuYGR4jHrAmletqQsTdg
         mUsjKR3haV+C0i4OwXfbVsHjNyd1PM7nT8ITLaMzwbLUPrFApVewknV4MpZ98V4rGzXv
         LcZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RkV6PNVW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j24-20020a5d4538000000b002f8467c7b42sor522179wra.80.2023.04.20.02.20.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Apr 2023 02:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RkV6PNVW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681982453; x=1684574453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l63fBVqf+skRhDHzj3FMLixVBb4pNQ9am7013dNRv7E=;
        b=RkV6PNVW6n9JEP7q9QIilInlQZVSD1/Nukfy2DtiYmAiREWPHpL25puerQvfCjRd/d
         Jfr3In2K5OCUpLK9GLr2iS4OXbka8Oo5LHE0WXfw1w39qN+nSmykKFIyGd2n8iYG0gxs
         mixgP+Vhm8HzyWgiwI0yiVPuL0D61uGn9RN3tpQJ2f4nOf6pGYIBebPsN5rG6dRVG6Vg
         GqXZO2hMkJ5HO6aZ3yBCM1ZGET+PM4JWzsTcWkXmfhC+WjOaVEyPcsrWCKvNjlRUo5PH
         uun6FXvPLhDnVUYMTk5XJ+Q3QgSihtsL/HCPmKMs6eGXQz0K++k4Q6j9OIc9p6pGssc0
         /Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681982453; x=1684574453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l63fBVqf+skRhDHzj3FMLixVBb4pNQ9am7013dNRv7E=;
        b=Ebg27J45f+EVfI7On9dQhLP+tuCmeg6B8ptdKK7XzLkn/uQiDZXqNTqMAaQdV0LhKg
         VUXr/kEWdC5XCCsz1VkvKS6o2MGxN4nED7sDnKa7bY5xgpfwZH8XrGuPINpwMxQGigCN
         Nwo4DvzyiOsNMfOjtyvXVrQ8S4nRkvvRAF4FxIF43PzgPylKC8n/uujWiZ9EQUp/X71L
         EXB/mQBb7kUoGoGcMHu1IbxStVmbJ2fG7Umm6czi8oE0eaNESq0FXdHOHL8NS2nwVjJp
         AJQ7yPhjzykvHE2rmDE5JTnNtBu3CPWu/WTx0YO+uA5ZoMsWc+Skkl9qNVicKr8oY9Y0
         lgow==
X-Gm-Message-State: AAQBX9cczHkB4JhB47oluvr+D3IVoKDMrgQU4CydSyLdhjOzoKEu438T
	Mez6lfRPW8rYkkVL95vlRviU4DMUQfMa8eFv+AyPlLDI
X-Google-Smtp-Source: AKy350bqVZdkE+t16ivdHoJLoy8lPC1yzqcOFEbupXS2gmcqWsQz9oPuILTXwJHGCqBltKcLuEmVWg==
X-Received: by 2002:adf:fa88:0:b0:2fc:7a4:839b with SMTP id h8-20020adffa88000000b002fc07a4839bmr910612wrr.61.1681982453210;
        Thu, 20 Apr 2023 02:20:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u15-20020a5d468f000000b002f5fbc6ffb2sm1465296wrq.23.2023.04.20.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 02:20:52 -0700 (PDT)
Message-ID: <b9c9d0d8-2177-b2bf-28ce-2601fe3a4840@linaro.org>
Date: Thu, 20 Apr 2023 11:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/6] scripts/device-crash-test: Add a parameter to run
 with TCG only
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Eldon Stegall <eldon-qemu@eldondev.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417134321.3627231-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /9DDW1T0b730

On 17/4/23 15:43, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> We're currently facing the problem that the device-crash-test script
> runs twice as long in the CI when a runner supports KVM - which sometimes
> results in a timeout of the CI job. To get a more deterministic runtime
> here, add an option to the script that allows to run it with TCG only.
> 
> Reported-by: Eldon Stegall <eldon-qemu@eldondev.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230414145845.456145-3-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   scripts/device-crash-test  | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
