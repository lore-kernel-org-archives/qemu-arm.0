Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2068975ejb;
        Tue, 23 May 2023 11:25:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69d9wWrSsXZ3QO4c0a3pkaLkV0MNAhVDUrPjBcw6jr8lSJyvLoounmz8WqqNWLqVnp+/xJ
X-Received: by 2002:ac8:5bd0:0:b0:3f3:8b2e:48b with SMTP id b16-20020ac85bd0000000b003f38b2e048bmr23475418qtb.42.1684866300750;
        Tue, 23 May 2023 11:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684866300; cv=none;
        d=google.com; s=arc-20160816;
        b=MhsncCOEtMdIcarRaR3IHuVpBXHTyfUhnIE2Xe7NDt1+M4yifIwnNf1OCn9xia6Nxd
         h0Bvn/cvN6+FBdDtlM1y9ccFBFZPLMjFdEhgam4SpZgfTEKnFTIGiBfdZa9Y1jtuQHLf
         +t9qblDToXsTnV4XLQv8qDDUcI45GjikxZB2jHc01CxAh6nlcZ4QEwB8HIp0O/8B4rOM
         7fBOl/MAfORKJev+M6rF4zPsWO6GejByr+xUNhbIZ6jsWyCik8mlVTj8rB+jwcFb+1ju
         LNCklMPc//jShZjM4Ytjdk+U/c78+Lb0jClIk8rLbOku/QEUL0c6jAo3fbXtXP30Mr3n
         k7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Cq+cAr4nytrYF4Rr1pVhd6/Nmg6m/Z8DXrgFb9PH448=;
        b=lc6T/0Bhj1ahEpklSdr9KyNj1RTnRlQ9RL9Z5QbmVynoEBcVpEnuwEG/BQKhoK609h
         7wWHT6SM+t/f4PuECfV6zDS8Zl1g/kc4XvbGsCrbXVh4jHOqRfXK+RTsoRRqvmBJiVz1
         0+oUZvu30UvHa+6/T/lE2+V3BdLrFeZAs3dkzLWfJQPT0yOvTPiAQtAZVpn9X9Ynsuax
         /YMOHQU0NKpRi1KFs8X8xXKXjIWoV02XF6mFI7ea6J04NxOcrEvspAyUhcDjC2qZIjXb
         lWmcd2Fn+cGaUEDALUjaT6qm1L2gsmV8YGmjWrsewduE38FFIE93TX5LI7PbWAIjT0Aw
         NkFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLmTyx0h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05622a050b00b003ef5008336bsi5588589qtx.28.2023.05.23.11.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLmTyx0h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1WgS-0004Cd-IM; Tue, 23 May 2023 14:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WgR-0004C7-9x
 for qemu-devel@nongnu.org; Tue, 23 May 2023 14:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WgP-0003P4-HN
 for qemu-devel@nongnu.org; Tue, 23 May 2023 14:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684866268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq+cAr4nytrYF4Rr1pVhd6/Nmg6m/Z8DXrgFb9PH448=;
 b=bLmTyx0hLYh/xoJNMnScQHWAlwqyOXfGpBM4/TWTLhe1voFNtvwzJCknOCvIZwKGzC4ouD
 Sfq+a4D0mQ176k22lvkI8OzB61vpkvqUo0AWfm/I2KPJyg84oyp6jd5U1U0hqJl0Za1O/D
 ynL6Y4rcH/73QeGWRHHs4HIxEQ3+/B0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-T_H4C0OEPjePMZJF2e244A-1; Tue, 23 May 2023 14:24:26 -0400
X-MC-Unique: T_H4C0OEPjePMZJF2e244A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-307897bc279so4980502f8f.3
 for <qemu-devel@nongnu.org>; Tue, 23 May 2023 11:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684866265; x=1687458265;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cq+cAr4nytrYF4Rr1pVhd6/Nmg6m/Z8DXrgFb9PH448=;
 b=UULhVhjkv9BAYuAsHFdN+7Yu3JVaKl/FPtBvYZ3ROm/Tx7omlmj7Do2GNgooGgbYPU
 faa0naPVUKPANFmBzTf+fiAD7ASunI4L0/A95tXoiBLkaW/3d0Je3OmTyS98/BOn9hO3
 AplL/GXWC6fJ+QzbjJhCp6OYhvKxJrSV9BJK2HZjSyDQxZCDEE4HSgW9igvl3hSi2Lvr
 OsLJHyA1ze436qDXBn7MwUL/InZrfRjC+smAV2tKeoEBGqK9CiYZHtXiugIfdo8C+Uwy
 jD/4bVYGbj7wQjzfnRC4T6mQMkku2UMyTwSj3W4mxgsHqD2R5fIEKm8HyLVYi9fVe0XV
 R1RA==
X-Gm-Message-State: AC+VfDxmDRVIz7GevZbLwxCIW24tB9rgLIvhSGJLwPYJAi+CJW40mx9V
 URwF8Ha+eIf5U8U6QCM68ssbTVCAR9fbEomKLqoF6SeSbSE9SRzVC+0YNlTMyOt2yB2kUuZMT8e
 48qwiHl0tbOUcENI=
X-Received: by 2002:adf:e442:0:b0:30a:7446:fd0 with SMTP id
 t2-20020adfe442000000b0030a74460fd0mr7493749wrm.31.1684866265431; 
 Tue, 23 May 2023 11:24:25 -0700 (PDT)
X-Received: by 2002:adf:e442:0:b0:30a:7446:fd0 with SMTP id
 t2-20020adfe442000000b0030a74460fd0mr7493736wrm.31.1684866265193; 
 Tue, 23 May 2023 11:24:25 -0700 (PDT)
Received: from [192.168.8.105] (tmo-117-143.customers.d1-online.com.
 [80.187.117.143]) by smtp.gmail.com with ESMTPSA id
 y11-20020adff6cb000000b003063a1cdaf2sm11893967wrp.48.2023.05.23.11.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:24:24 -0700 (PDT)
Message-ID: <af132528-fe90-5ac1-6a78-fadc06eb8e75@redhat.com>
Date: Tue, 23 May 2023 20:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] arm/Kconfig: Keep Kconfig default entries in
 default.mak as documentation
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230523180525.29994-1-farosas@suse.de>
 <20230523180525.29994-3-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230523180525.29994-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VsRNM09FDGkp

On 23/05/2023 20.05, Fabiano Rosas wrote:
> When we moved the arm default CONFIGs into Kconfig and removed them
> from default.mak, we made it harder to identify which CONFIGs are
> selected by default in case users want to disable them.
> 
> Bring back the default entries into default.mak, but keep them
> commented out. This way users can keep their workflows of editing
> default.mak to remove build options without needing to search through
> Kconfig.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configs/devices/aarch64-softmmu/default.mak |  6 ++++
>   configs/devices/arm-softmmu/default.mak     | 40 +++++++++++++++++++++
>   2 files changed, 46 insertions(+)

Thanks for the update!

Reviewed-by: Thomas Huth <thuth@redhat.com>

