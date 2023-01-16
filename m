Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1414799ejc;
        Mon, 16 Jan 2023 05:50:27 -0800 (PST)
X-Received: by 2002:a17:90a:5901:b0:219:b936:6bd7 with SMTP id k1-20020a17090a590100b00219b9366bd7mr92417263pji.19.1673877027280;
        Mon, 16 Jan 2023 05:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673877027; cv=none;
        d=google.com; s=arc-20160816;
        b=NwrhelioZjKg0SUMjRkA6BXbxdtW3KYNVALdZKOwPkOP1eKMDYBo0U/VihLevD+uh0
         IVSlZKdxEfwLrsR5vsnTgjV+2ApWGk0jVkQVgL8XA+3aFj8+iaqNw3e+DcYVs5Crcy6s
         iqx1NVRXwSTutXjHAYmanql9ntkcCsc6PD4gs68wOhSlftf6CuncehkLatzgwv79lmHp
         qvX0tXajSmCTa7uEYFKBP20GfKhx8pwsIeB7kS0fUCSaCD1KDfG9FmzYEFhw3fC4VVl+
         HgdY9Rxo5CnPe2UVDziGVOvhDFYxPuWF+E1qkW5ThSg370y/1Rlt6XLLm7pJasqevK7f
         +cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jzfMACBZcfY4hkCHTh1tjKMJKu8fAtcHzrByGZdQ7rM=;
        b=wMp1USvwIGG7Atp/uFKuKMzvxWYXv/WV3yDrjcV0uXKWN0Rs7FZxRjrBBjRdF9K6RP
         ZjIyiA3PUKCSsMW/Ylwq4fZUQgh4ZCvsbTGfjeP8dJ1SfA08UxWTUIBKacyfvmuiVo7B
         RfqsPS+d8TLEA6YYsY1g8myo5nTx/XsxgKVnU7G1YLMBE49RZFYvrAQwFqGZU0gbEqxM
         HJCY+nHAp0XV4kyLz3WGQrOcZ4RNLk00KBB0+0mNHIUW2Sk4E8FOx/w0kufYhTnf630j
         MkrLnubscuF9XN8Ai9E0VGeWOXtbpZmhfODAvPd4b6U5zb15Lm13ueMHzJuD4/U4hNmY
         OE5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S1Lm/7Ow";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mn8-20020a17090b188800b00218fb54526dsor13570609pjb.3.2023.01.16.05.50.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jan 2023 05:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S1Lm/7Ow";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzfMACBZcfY4hkCHTh1tjKMJKu8fAtcHzrByGZdQ7rM=;
        b=S1Lm/7OwzakI/cS5aQfWAefomNa5mw0jPPMaFV+MrExOEdp4tSh60PPjlmeuH1Hw72
         iAWiz2vL+dQ6JjeZehAvAg3/XBgwevVsJWotRswYcwmxG15FK0MyK/KsgEow2q9RT0k8
         7emUerL+Y3Ddf/p6GA+aYEV2TH3cbaL97Wumd1QhmYs+hzAADEaQ4SqX+yhKJzhv3J+6
         KZffuOTAFaiFnwWpE5tqkicGz+OYk5/zBtHbP5tX+NHmVvdnGZ+BMUnUpsSaRpIH39EX
         qSsZXVc6ReZy12zKq7U+b4zBx5vCQtiy6cNhZENQbrIE/5nw6pDPCV2+ANNFtV+mFIye
         1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzfMACBZcfY4hkCHTh1tjKMJKu8fAtcHzrByGZdQ7rM=;
        b=IpU6wk0Z1u3JuR87VGHq9F6+ednFsJaTVX14FTOjUUG8ibk+7rxGN5n7aQSE0q/fbC
         twwCanSYIVsQukGmUc+oEX7YmuSoT7F+L4SeFjF4R8rBv2cun9Pyj278Rlo24QKngZ+t
         78xowAL0UiZGitwH6QTE1p56o0E24Yzi+l0oQ4eICCxARSNI9MJJSQnSZ9cr5MHeME3R
         jqSjjdEac7Oo1kLXXkR1ypuLkE4iLOYKcKlr1UbG1PRqWZkBQ+SGQihbM8d0nRAUOA2Z
         fx2zHLG3+K+mcWJMhqmswCI+sNMsfgAzJq0rFns4q67iIDEPK2WwTUUFP/pfBwqUCdn8
         HnfQ==
X-Gm-Message-State: AFqh2krvqXIQA1k4rWsfijcfo+lSf19BtCbBqXxy02Cep6ZxL2dhwGtT
	DgeXAjJjh/KcE8NORWXdynjr2rw8NB3ceFoqBWHF2pVn
X-Google-Smtp-Source: AMrXdXsjubQReZkgGG6OzJxDbnm54HEYmOgtYpDo4spAQC660XGpSjp0IpgW0xAe8ryRoC0DmeAVQJN9cCUklZhD22k=
X-Received: by 2002:a17:90a:f50b:b0:229:2631:e8 with SMTP id
 cs11-20020a17090af50b00b00229263100e8mr919319pjb.215.1673877026847; Mon, 16
 Jan 2023 05:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20230113140419.4013-1-farosas@suse.de> <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org> <874jsqzj7m.fsf@suse.de>
In-Reply-To: <874jsqzj7m.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 13:50:15 +0000
Message-ID: <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
To: Fabiano Rosas <farosas@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vVYVs8yIGGld

On Mon, 16 Jan 2023 at 13:45, Fabiano Rosas <farosas@suse.de> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 1/13/23 06:04, Fabiano Rosas wrote:
> >> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> >> cortex-a57 as default cpu for KVM.
> >>
> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> >
> > Ideally there would not be a default at all, requiring the command-line option to be used.
>
> We could probably do that now without impact to users, since KVM would
> always require a -cpu option due to the current default being
> cortex-a15.
>
> >
> > Second choice would be "host", since that's the only value that's actually usable (except
> > for the off-chance that you're actually running on an a57, which is less and less likely
> > as time moves on).
> >
>
> I'll have to go around fixing qtest first, either to add -cpu or to add
> -accel kvm, otherwise we get:
>
> The 'host' CPU type can only be used with KVM or HVF

For a CPU type that will work with either KVM or TCG, that would
be "max".

thanks
-- PMM
