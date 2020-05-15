Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp313044lfb;
        Fri, 15 May 2020 02:07:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx996jXmScYIw///xv13sDXjoJcKf1tIuOKvOlCAc+lOgNE7tdvrRVUtJCuoaY2VjR9B3Sy
X-Received: by 2002:ac8:341c:: with SMTP id u28mr2480460qtb.0.1589533636700;
        Fri, 15 May 2020 02:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589533636; cv=none;
        d=google.com; s=arc-20160816;
        b=CbaStXMpZrxuoRKMYIyZWtl4kHfHNZA0slF3IoLQQAL8B9b5wyjW9n3uccU256GQPg
         F3AHG9wrOXU1XhqnIjVtUZFG+FjYVOk6iWfclkB51+Ghx18nN1WyompScuP39Sg49Vrd
         /XIejwbSQ3z5SuIGGsIOlfTZhrx7O54D8HrNlVLLWA7WRKJERqd9LN05e2M0qv8KsoNX
         uVtH6udGDKKXK+m8I7ALA9WqJxlraOc1dIw7xeexc77O0jNkmvnIs7EmhAx+plx417Qs
         cIKCpayjVpTENjmpdSG0iZu7qccXPj/QV8lyimWaLFrZ5HuAiINjNpIf6MnSf/eKUaec
         CILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=frfSkXLGb2Gs7NglNQYmQor/+GNC7jflBzuc//1OHrI=;
        b=PXZ8PENMM1J6jR/VCIos9hMQNGMh+syKfzLjT0nJBQ53+1ZRT1kwNL/DwIFkVWk0le
         aAwog/cuMqL2rbCg2e2zql9ZYoPE0Pnw8Tl2piZPzknY4Wbez+v2XugRaCD5LTnuOuxa
         ScNojzI6CW8R42wuvUiHg4DsMlVL1wzukFWXZkB1f/mLTvkU/aFThrqhhfJLFsCEEiu2
         qZhKSQjaCKwJPA86hIB5kr7UTBmcrST3Ibq0YlqIm6Q9BQP6cuFjSCr8fhkZCGsnsHJ8
         eeh03Q/imzdduSebTWVIsAdp1NV4bCaKB969b+jNpaQIH6D3BP8CcmYsMgET1AaDBndr
         /g7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZMa4C1l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si804337qts.315.2020.05.15.02.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 02:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZMa4C1l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZWJI-0000Qf-3w
	for alex.bennee@linaro.org; Fri, 15 May 2020 05:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWIc-0007zb-6b
 for qemu-arm@nongnu.org; Fri, 15 May 2020 05:06:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59224
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWIb-0002LR-HA
 for qemu-arm@nongnu.org; Fri, 15 May 2020 05:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589533592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frfSkXLGb2Gs7NglNQYmQor/+GNC7jflBzuc//1OHrI=;
 b=bZMa4C1l/NsMekWeoot0c4GV5//Wy4ckssDDJ0QpjvEKhV2dCfaTQ82J+t54sNRC28ldTb
 W4u2Ye5JUXpvpCtPz80Mwr2zkO60Poq1EwhNcv8Eum0pN7g31RINZOVtYV0xVEBrn+QYFb
 3gXx5gwT0R/h1C/dH56Jb6lRBU8Pxzs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-rMg9iB8eMZq-1bK5vbz3cA-1; Fri, 15 May 2020 05:06:27 -0400
X-MC-Unique: rMg9iB8eMZq-1bK5vbz3cA-1
Received: by mail-wr1-f72.google.com with SMTP id x8so851837wrl.16
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 02:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=frfSkXLGb2Gs7NglNQYmQor/+GNC7jflBzuc//1OHrI=;
 b=KR2qwdrt6sZNQh4iXqP5CJRCeVP9etJz4qMuvV6jP+oQEWxF2JruqtLze8ZT30ewKQ
 w7wDw6AEdbqFUVZl/Z9xfTUslmq2duWQ/GDGyOxhYp8xea1L/aFcPzBlhppU3TzZv2b+
 tZ0jHDv4PkUtfpEwFbJth+o+6wWRuobqJYZ/XTp5oBRWYHeDCRUBR0tWnTlWRKOWvglv
 QnRzdwUPVYJItiQvpcBfz8m3cNVAHbFiol+47gqs6VwwDZNCD/Gx0YBANFQeoFlWYFZF
 STVUIE155xc6QttgOofKOfSbnRRzxH13Oz2MGOcFh6HdUsE5Ey+foGXd4icfNqoEpOTP
 CAmw==
X-Gm-Message-State: AOAM530U1v1pCvgLpvaaJ/UAx6UwwBN45o4NmDWIIcOrMno6ZvNEqWVM
 Gi8+/WMI+CWUIdlkbcjoXAVfz031Ul40QqJrqsGPLb88KWkTNS4glSEGcYrc3YYHwFRQnnGTZgg
 MXp3pw6u8hd8T
X-Received: by 2002:a1c:65c1:: with SMTP id z184mr2905904wmb.60.1589533586505; 
 Fri, 15 May 2020 02:06:26 -0700 (PDT)
X-Received: by 2002:a1c:65c1:: with SMTP id z184mr2905880wmb.60.1589533586292; 
 Fri, 15 May 2020 02:06:26 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m23sm2609515wmg.45.2020.05.15.02.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 02:06:25 -0700 (PDT)
Subject: Re: [PATCH 5/5] docs/system: Document Musca boards
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-6-peter.maydell@linaro.org>
 <9a94c5a6-cbf3-184e-40f3-25b18052dfa6@redhat.com>
 <CAFEAcA9BR6Aajz72=vLwpASrt=Px3gdMu+VhS9m0LZxySgdMvA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c1015c97-840e-1db4-4480-6c70ff252e46@redhat.com>
Date: Fri, 15 May 2020 11:06:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9BR6Aajz72=vLwpASrt=Px3gdMu+VhS9m0LZxySgdMvA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uFtYJT4+LBry

On 5/15/20 10:48 AM, Peter Maydell wrote:
> On Fri, 15 May 2020 at 08:56, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 5/7/20 5:18 PM, Peter Maydell wrote:
>>> Provide a minimal documentation of the Musca boards.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
>>> --- /dev/null
>>> +++ b/docs/system/arm/musca.rst
>>> @@ -0,0 +1,31 @@
>>> +Arm Musca boards (``musca-a``, ``musca-b1``)
>>> +============================================
>>> +
>>> +The Arm Musca development boards are a reference implementation
>>> +of a system using the SSE-200 subsystem for embedded.
>>
>> Maybe nitpicking, but this sentence seems unfinished.
>>
>> " ... for embedded [?]."
> 
> That's the name of the IP block:
> https://developer.arm.com/docs/101104/latest/introduction/about-the-sse-200
> 
> I guess it ought to be capitalized: "SSE-200 Subsystem for Embedded".

Ah yes, it is clearer.

> 
> thanks
> -- PMM
> 

