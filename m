Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A59DCAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:40:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gwY-0003vn-HG; Fri, 03 Oct 2025 10:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gwO-0003uc-OH
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:39:24 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gwD-00063C-Hw
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:39:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-781251eec51so1999199b3a.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759502337; x=1760107137; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qj2M7pQmFYVDX7KwBJSCJqwEHIagQtqZZ1FYUBfhobg=;
 b=MF+BvMwRgYLRkSsvCRBYi2ORaGY0ckVkdINbRDh6eJ+EHcs2E3E85wqmo2UFupo5XW
 5j6/YjLECcMvfarkXKBGwRyeQ9rAW6QecCUSzeAr5lKnKs2x5fi4DDSp/NHp1DHeAhLX
 o/iGvIeMkHoz3IxhqXsII4VJUBjbAgQsAeSXqSM9IfTr01MBQBuW/m9jPO2I9wjL0TSf
 V2UG5bys75rwtTlExifThp1UGYPGLKDV7vNm50cNRFRdZOvcfY9NCbpcimcWSPZnrF9J
 M569LoAuI2bTTPhefIFOIWmGjXumI0SVubqxv9Uw5T4FIlnwSHOK6exLDW2lo5yHOrVX
 Sklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759502337; x=1760107137;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qj2M7pQmFYVDX7KwBJSCJqwEHIagQtqZZ1FYUBfhobg=;
 b=rX12hMbCeV6wTdh3f4kCbQEtBK4v3YEJLPCtAUZDwPb9HLoqZz8NBntIvtHJWJnbja
 vVUKyF3QFQKZVE8Ur73TKQo2Q5eIeA4zoHt7Db46kVNBaufmBV9zMjJt8fahRJkcW4aE
 rbQrtuVn0eJp6a2Ap7ejZN6IKWFwYa1wHF64XQv4R5iTNZkT68uQWTuU+bQ8J5TiHT+H
 z/JkkdrtaCDlbGrj7G+htYj1/949/4GAujNe60biaJCXe+1OYTXEYtYOaYHQOhUzeMDK
 vDXvFXFFjG4Y+qfP/F2Uu6KFEORQ+BK8KmQsynD3Ehv0hOQrVxPjMPzX0pPXwCOL5use
 sSvQ==
X-Gm-Message-State: AOJu0Yx8gMLjlLnewJBlFBVIBuIZOnDWTSCm6O1LNy1h5SB94JXQYAeZ
 Ze/PXQ5Ss7OspyuX3N7GjI+/rFkbMQqzckh+ygTw24kqo4CaDCW/No5ttE8P8W2c2hU=
X-Gm-Gg: ASbGncvccBmJQT+hDm1oUQqlI4JGQw5nzDi0TEqKbsrhHYmvAecWwEALE63uKPC4BwH
 bjg8udXy7o55MaXoURwdCVTxBcl0jcA/IYlonvixe7FvIlR0lHe/jIKHOaNEX34gmWNqf4b5Bbl
 mPANtb9ZX/KXSj9yriZwSefz8L8j2Bd1WLRJ8D4NxxZQlrE+3ws1tVU+zVRFBu72PRB5cAzJP1Y
 0w2i9yXniIE7QbH61q66BO1HPDLGbDaqSkzrceJtK7+o2o4NkE7BHSxm70imcQHx0w6s3Wg2VSG
 j0BXAq77MvOqVyc76+lC2Sjw8YW5k0WWOPdhjm4BgegBbZ3Qr0IRJo+pOODc5iZVfv6W6jhqeNz
 Lzq9Q8ycPYkPr5UzdIv2dgVzsotksls/Fm07coAxLID6p2tRN2bR5ySPFibv+dJUA1VyPhc5/hg
 ==
X-Google-Smtp-Source: AGHT+IGYxViI5t9jT9iDd0v2q3AUUuJyg7Gn1R4FA46ru3DdWMRJz74dQgLCK27vJFuo5vRHUMIlCQ==
X-Received: by 2002:a05:6a00:1884:b0:781:275a:29e9 with SMTP id
 d2e1a72fcca58-78c98cabc07mr3964818b3a.16.1759502337380; 
 Fri, 03 Oct 2025 07:38:57 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.59.111])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053dfesm5172081b3a.51.2025.10.03.07.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 07:38:57 -0700 (PDT)
Message-ID: <8d89f02e-9e5b-4cdd-9a54-d55bea8967bc@linaro.org>
Date: Fri, 3 Oct 2025 11:38:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <b5cb30d8-65a2-4bf7-b66f-5bfe61e19835@redhat.com>
 <8fb3351e-f1a1-4a1e-9650-33f0d4ee6d44@redhat.com>
 <bb7801f1-67d3-47d7-b5bd-39b1113ea9e0@linaro.org>
Content-Language: en-US
In-Reply-To: <bb7801f1-67d3-47d7-b5bd-39b1113ea9e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Thomas,

On 10/3/25 10:30, Gustavo Romero wrote:
> Hi Thomas,
> 
> On 10/2/25 14:52, Thomas Huth wrote:
>> On 02/10/2025 18.53, Thomas Huth wrote:
>>> On 02/10/2025 04.04, Gustavo Romero wrote:
>>>> The goal of this series is to remove Avocado as a dependency for running
>>>> the reverse_debugging functional test.
>>>>
>>>> After several rounds of discussions about v1 and v2, and experiments
>>>> done by Daniel and Thomas (thanks for all the experiments and comments
>>>> so far), I've taken a new approach and moved away from using a runner
>>>> for GDB. The changes, I believe, are much simpler now.
>>>
>>>   Hi Gustavo,
>>>
>>> unfortunately, this still seems to be broken on Fedora. After applying your series, I get:
>>>
>>> stderr:
>>> Traceback (most recent call last):
>>>    File "/home/thuth/devel/qemu/tests/functional/reverse_debugging.py", line 100, in reverse_debugging
>>>      self.reverse_debugging_run(vm, port, gdb_arch, last_icount)
>>>      ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>    File "/usr/lib64/python3.13/unittest/case.py", line 156, in skip_wrapper
>>>      raise SkipTest(reason)
>>> unittest.case.SkipTest: Missing env var(s): QEMU_TEST_GDB
>>
>> Looks like it's required to explicitly use the --gdb=... parameter of configure to make it work, and it does not work without that paramter? Could you please have a look whether it works without --gdb with the auto-detected gdb for you?
> 
> Yes, it works without passing --gdb on Ubuntu. I'm checking it on Fedora.
> 
> But at least have you got the test skipped properly (displayed on Meson as skipped) since QEMU_TEST_GDB is missing?

hmm actually, no it's not skipped correctly. The @skipIfMissingEnv() annotation is in the wrong method.

I've just sent a v6 with:

diff --git a/tests/functional/reverse_debugging.py b/tests/functional/reverse_debugging.py
index f06996089a..2a2e51b912 100644
--- a/tests/functional/reverse_debugging.py
+++ b/tests/functional/reverse_debugging.py
@@ -63,6 +63,7 @@ def vm_get_icount(vm):
          return vm.qmp('query-replay')['return']['icount']
  
      @skipIfMissingImports("pygdbmi") # Required by GDB class
+    @skipIfMissingEnv("QEMU_TEST_GDB")
      def reverse_debugging(self, gdb_arch, shift=7, args=None):
          from qemu_test import GDB
  
@@ -108,7 +109,6 @@ def reverse_debugging(self, gdb_arch, shift=7, args=None):
              # skipTest(), etc.
              raise
  
-    @skipIfMissingEnv("QEMU_TEST_GDB")
      def reverse_debugging_run(self, vm, port, gdb_arch, last_icount):
          logger = logging.getLogger('replay')


Now, I have not idea why GDB is not detected in Fedora. I'm setting up a Fedora env. to try it.

Are you sure GDB is installed in your test env?

Do mind checking if:

gromero@gromero0:/mnt/git/qemu_$ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
gromero@gromero0:/mnt/git/qemu_$ echo $gdb_bin
/usr/bin/gdb

works in your env and if QEMU_TEST_GDB is in:

$ ./pyvenv/bin/meson test  --verbose --no-rebuild -t 1 --setup thorough  --suite func-thorough  func-aarch64-reverse_debug

output?


Cheers,
Gustavo



