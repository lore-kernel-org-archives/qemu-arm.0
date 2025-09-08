Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2865CAC581
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 09:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvXme-0005IS-0R; Mon, 08 Sep 2025 05:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvXmb-0005Hx-3z
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 05:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvXmK-0007zE-0g
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 05:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757322131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dY1FYqqBalZXG3Fq248Po3+1V3giPHlXujXYqhviE1w=;
 b=E26TQIc3FIb7/5uXuzR148oQJAUHaaFHcJjvT1e0FOH9gW/zhWqIJGS52eQ+8C1Kg/qV0Y
 DqWo4hIR4RlweaadZYUfaLg8PkvnMeO9Of8a7WdfLjjuFD2DtOTF1+8HUm/KaPymSg+5lI
 YVXGO2sXL6Q/zb0N4R0gHb0FkI1XNzk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-dHbrgtdNOx-llWk5CMPbTw-1; Mon, 08 Sep 2025 05:02:10 -0400
X-MC-Unique: dHbrgtdNOx-llWk5CMPbTw-1
X-Mimecast-MFC-AGG-ID: dHbrgtdNOx-llWk5CMPbTw_1757322129
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a15f10f31so28876945e9.0
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 02:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757322129; x=1757926929;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dY1FYqqBalZXG3Fq248Po3+1V3giPHlXujXYqhviE1w=;
 b=c7QtYcxY1WpgIJ5bVgr6Z9YWWHmj8HBdldEedFY6QhpE50iV+9krYX+D4SrL6EYoDy
 znh63SBi7Ae7kaMHf9XhMcF1BxCrPTEQWgY/oDF5MsoE2ModILmvMZ8NesWHhmJLfCa1
 i6DZ7IaOYnUhDeCHJFNI/q9Buqe4ziQNLCdP2t2JqgcVrZ/ncZ2IKbMBi9l+Q/nYf1GS
 7nOEPWXfjiihX2iMpBk3GeyxbbcMbPeRKe2vbQkQ8uWiJ2zcYRlljBkq2G56TZj7cNMQ
 XZfqLPq+WSRuTvAbjWanavM+1arjR3YQfcoBCVK6M84/gjJCSFIv6NK1doePDtSlhMfO
 HNzA==
X-Gm-Message-State: AOJu0YwyEy7CXPcR/40fW+EzQe/qsOZze0b9t8VCxgygSRWWX3B3N16s
 3KA5EnFzFcXzJheBdPSWWj9Px5Gbq47/DYvNw9iU530/D3hoky5i0oQbK6pVfEBzbiKLoujmXWS
 1VjyXrgjxdetNvi9fYyZRcMJuZvDrzTGBx1lXb+q3wmAMjUL61sOL5A==
X-Gm-Gg: ASbGncvWxXOYjaIs4eBXuMFbK02Vc32mBiUDSGXFPQdC2GL+u5/jxM154v1itumVbDF
 4ax7fIDQqwtjMVUe3R0eaaVY8KTDPa9NQc28/ml3q1dackNxj6KerRnzlNsBRKcbRGZ8buz9nmx
 jHHvimid3lF9EI8qPYuOUIxeWsve3Ge01HZVmVQcZce7tolbZn6DLKEmVlNfP3Gwqi0TYeBzsbK
 OkmMy2S0h5B9PFhTltG93VeiY+NaiOcQ3l00SqPEMqbPfvtqtoXX3PbIGltxwzDk2bSXR14Pwun
 XzlPAfSehVy7qcwpII2MebbUE1qAOqtUD57yAapmIlXg558TbZylKdCBnQfrXUkvck30qS5xEig
 +6x4mSQ==
X-Received: by 2002:a05:600c:8b5c:b0:45b:9b9f:88cb with SMTP id
 5b1f17b1804b1-45dd5b78584mr95536845e9.16.1757322128897; 
 Mon, 08 Sep 2025 02:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3WVA3UnL4Yw3tRBj87z15x/SiJnqbyZSgM3VHmzs8+n80yu0wSPHpZMVpAISBgRP66O1H1g==
X-Received: by 2002:a05:600c:8b5c:b0:45b:9b9f:88cb with SMTP id
 5b1f17b1804b1-45dd5b78584mr95536525e9.16.1757322128483; 
 Mon, 08 Sep 2025 02:02:08 -0700 (PDT)
Received: from [192.168.0.5] (ltea-047-064-114-112.pools.arcor-ip.net.
 [47.64.114.112]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e2f6af9791sm12881241f8f.26.2025.09.08.02.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:02:07 -0700 (PDT)
Message-ID: <b71c590e-ad55-498b-ab48-fee144e9d419@redhat.com>
Date: Mon, 8 Sep 2025 11:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] tests/guest-debug: Make QEMU optional in
 run-test.py
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, 1844144@gmail.com
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <20250904154640.52687-2-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250904154640.52687-2-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mBj5gzLF0eXfmcdFqZ0NQ1Ux02LPgh6jFswkDxQDEac_1757322129
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

On 04/09/2025 17.46, Gustavo Romero wrote:
> This commit makes QEMU optional in run-test.py, allowing it to be used
> as a GDB runner, i.e., to call GDB and pass a test script to it without
> launching QEMU. In this configuration, it is the test script’s duty to
> configure and run the VMs that GDB connects to.
> 
> sys.argv passed via -ex now includes the full path to the test script in
> addition to the script’s arguments, which allows unittest introspection
> to work properly in case it is used in the test script.
> 
> The --binary option continues to be required when --qemu is passed.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/guest-debug/run-test.py | 60 +++++++++++++++++++----------------
>   1 file changed, 33 insertions(+), 27 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


