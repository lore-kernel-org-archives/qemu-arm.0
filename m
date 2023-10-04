Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2621960ejb;
        Wed, 4 Oct 2023 05:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3EbLZaNIMncGatfYCTVKDLgTgFTsDUDQfT3cde9UCioVKp9aOwUyDiISrymMlMt9abgaj
X-Received: by 2002:a05:6214:584e:b0:655:88e9:1b09 with SMTP id ml14-20020a056214584e00b0065588e91b09mr2440446qvb.18.1696423061002;
        Wed, 04 Oct 2023 05:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696423060; cv=none;
        d=google.com; s=arc-20160816;
        b=VtKGroA1wuS0DpMoSaRMTC2sD7aIyLwUP6aj6KR4FcKXq6granA6CF90oBh3SlKggk
         4jQ5eRaggVDp1fq6FEfiDKojLmuuYfZ1L8FCh50lJJ8xxFpbAijblg9C34CoS5jL36pB
         iCmdZkgf3DBsMV//MWUlzd9oOeCkyc/InLZoSsbngXnjEtYow1660ZPOy3SOTQjzVXdP
         l03S+EWElIrVTzVDxstvkN1vpurDNAXkMjhwBoRmzA+or6R3/AlUExiXaMZuL4O0QXwa
         2VcV5saP9jXJ5+UGcHqav7iJhUqGDi+uL+VJOUr00/m9D4sDT/s2adCKunMr9TYKJZ6k
         D6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QAi0IIFmd1uLGA69a3sYX8NgxiuutGABC52gw0w1l+k=;
        fh=anxBd7H/2n+zlq9OSztq69LPVe0cyzd4xswvcAAGMbw=;
        b=XG7lD5RAafTBLfAD7htsVSnhdqD54GeeacTRaivBxq+G0GzfgbBgRcweDpUlaZjpOv
         nlTOCMoEuXfiQNP6vyUhk3l/u4yh0VI/6Yw6e1rpNUmrhTHCBCKrnFvo/QYek8ZJ37zl
         lnIj9PMpMLwG0Xq2xQP/ddQZq5Z5D+lJOSN+JldsmjfT5DbbbCd6tgF2nGvZTcA6ESKg
         79M/XYA+0JJ/U/doVpaqSgkX4DVKCwiQ0pzCpuDRv+ku7I9nHVr+lhWFrWWOJd0a94EA
         ROK5egVd2GTuLrLZdz09ciS01Bx2QtcYsB+o2zQqCMvJlg8dgGxYJh3ZD1dJgTblWg7q
         pzGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4bZLOb0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a0cdb07000000b006558891f406si1407492qvk.559.2023.10.04.05.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 05:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4bZLOb0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo17z-0001iB-8q; Wed, 04 Oct 2023 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo17y-0001gE-FQ
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 08:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo17w-000122-6x
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 08:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696423039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAi0IIFmd1uLGA69a3sYX8NgxiuutGABC52gw0w1l+k=;
 b=X4bZLOb0K8SGJSrpkSGC6ieN5/wamWVPucrvS3JyzdSEKVHKC4r1TbYz47ljBzaWr7AC5y
 TzDlYWLYMTlJKao+6Hp0ae+Qako7wsNUaop12K4Sk2bro4iJgtKsHdhOifHIcHvDCmeVfu
 pGIp8hlLQu/vjRt358NMQ8TCHdhMvd0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-pXRVr8xqNiqeLSOEvaOF0w-1; Wed, 04 Oct 2023 08:37:17 -0400
X-MC-Unique: pXRVr8xqNiqeLSOEvaOF0w-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41977b9970dso21714541cf.3
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 05:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696423037; x=1697027837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAi0IIFmd1uLGA69a3sYX8NgxiuutGABC52gw0w1l+k=;
 b=o9VLVL30OrSnNSsIT/jrrrXwGbLrUHB6e3x6PB3EH+YiRdTUpZudytfUJe4uSUfDT7
 dPZPFI2la/QHUzFjSfN6LwBKsC4pTxg5qn2XCozsqZsDOog5K1WwCsOQ9K744n1kJPsn
 72GqS4/mCEuTeIBG5+QtOxYXf5M3R6dJYNY+hV0WrnNa2gOQDM4qmeywpe4DbpNJj7Ia
 p+aswZb5BaksYtKsP4Bq0Sq20iqvEvN4cFNzCq1VH5PHXgJtZfP0n/eG3jLxp+03oPnA
 dRnoOFcCkpIFbJ1MrdgHxsu409Dr7/15Wl0A2yAYcbr6CGhU8thmSpLgLM5hpMnUWH74
 XCjg==
X-Gm-Message-State: AOJu0YxX77ov6UWydGcICaHN2q7q/hz+wMk9GEd7mGflKWKp+ZqiEDcW
 mx5nxP7qFNS8+NnOwX+Pjd1AdNlVAl+VkW0HdXQL3rmElIIkwwJEo7W7Gld1wh/Fx7AonKTH67B
 iL3GwC+sj7wDj
X-Received: by 2002:a05:622a:30c:b0:417:f9e1:664f with SMTP id
 q12-20020a05622a030c00b00417f9e1664fmr2064827qtw.36.1696423037205; 
 Wed, 04 Oct 2023 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:417:f9e1:664f with SMTP id
 q12-20020a05622a030c00b00417f9e1664fmr2064814qtw.36.1696423036930; 
 Wed, 04 Oct 2023 05:37:16 -0700 (PDT)
Received: from [10.200.209.159] (nat-pool-str-u.redhat.com. [149.14.88.107])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac87546000000b00419792c1be7sm1179462qtr.30.2023.10.04.05.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 05:37:16 -0700 (PDT)
Message-ID: <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
Date: Wed, 4 Oct 2023 14:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZR1bjpEi5HdFp2xj@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.528, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: Cma7Kc+pd/Po

On 04/10/2023 14.33, Daniel P. Berrangé wrote:
> On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
>> This series finishes the cleanup which remove the confusion
>> of using 'softmmu' when we really mean 'system emulation',
>> as opposition to 'user emulation'.
> 
> Am I mis-understanding what you mean by 'finishes' here, as
> I see many references to softmmu remaining
> 
>    $ git grep softmmu | wc -l
>    270
> 
> In particular under configs/
> 
> I was also hoping it meant that we'd be changing configure
> to allow
> 
>      configure --target-list=x86_64-system
> 
> though the lazy side of me would like
> 
>      configure --target-list=x86_64-vm
> 
> for less typing

Maybe we should also bikeshed about the naming first... "system" is a quite 
overloaded word in this context already, and "vm" sounds rather like 
hardware-accelerated stuff ... what about using something like "sysemu"? Or 
"fullsys" for "full system emulation" (in contrast to "user space"-only 
emulation)?

  Thomas

