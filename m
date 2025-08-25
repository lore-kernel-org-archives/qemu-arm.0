Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E936ECA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 17:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqaxL-0003gI-1X; Mon, 25 Aug 2025 13:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqaxE-0003eh-VA
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 13:26:02 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqax7-00076O-A7
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 13:26:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-76e7af160f1so3204748b3a.1
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756142748; x=1756747548; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fYKbe9ncNwqqe+1Xm1xyn/K+Tb8QyIwu7dHyiN1QNcg=;
 b=OqcQW/klxWIPy40Vrh+NCsm22INSyi2ti1EyM7x5I8ivSW18F6gTudcjM9OHIYYhzQ
 ofsaH15f3sIWFRNF1SytV1KXqN+n50lQjz95lEjvdoXVZq1mAWk28sAfEmrs/Qn0Q3ht
 8daq9wfUcg3JoYw2BB6el4BPlaYB+lWvTSdpEPx45tXdBdir1bGuUhFfMOsl8JSZyrCp
 H6Q1l/YSmdjzn2PVjepb5NOquBAYRC1Qiy4yvoEkqzHHgtftY/oRRC1mv+fckFbhgPe6
 OiLfadwpvITeTETfK1Rl3Bsgucwo5R8NVR+6q5PQfaDPd4UW2S8qYFRB7YlqlSY3ulok
 vsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142748; x=1756747548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fYKbe9ncNwqqe+1Xm1xyn/K+Tb8QyIwu7dHyiN1QNcg=;
 b=qINtGjqyPvq2TQykXYe/ZVxqLFWdO1JEQbeVRu4OjKYiIk38bHIFQ8Yya2rG98zOXQ
 faNliE+rgziyfP/IradwkdiUAwohDa3bHJYC22qTki5/el+GSS5lrBhu4/1LvuV+xf/t
 JSry4iJkTutUajznwPmyofZ781cmgFM7CqE/lZwsTOO/qquh1COeGbSUAqiaReWex52z
 T1JBlf482R9LoFC0Ib4i0fbjcPW4zSSbyUyji9dFEBR2U2uB2OowWevmOe3NjXRchqiQ
 XTn+Nr3/e3tCrbtS/zoegt7YHl8fPPPXf7xBf/fCfFCL8eY86xqlj7xBnFbckSKaNLgl
 LTkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0zqMqeKN4rrUWt5YEYMj+ngd5zGBL0ieYcjj3V0ApPhhUfRbOiLNNdZwUvQBCuydDe8N+S56TZg==@nongnu.org
X-Gm-Message-State: AOJu0Yy+5mzCDTJo0Z6MjEJM5K9iSegAN87MmEWiT0NXWx5qhhOLhWB8
 uvYPoTHGvJE9OHnoEEaU3Thj+8CHgunTNAGp/XzlbHkZv+uFO2aLvj+YmxzbxGYMPVc=
X-Gm-Gg: ASbGncs4fPeXwK52DMb4g3pjpbZbYYQeFiIDTRLm0UcSjUd8Mcm7RWHX3DebYgm0gVa
 vVc3ZCOZ20uY8/YFaUVqoT0dwD03U+vn2QyPZKkh0fnPBNWb3vED/uyUkWVXG4350rKWOMkdg7l
 XDfG1jf3QDS35Oq4EzyvlCYuRF33hazP9D5qcxj+0pZqFOBK8JTFydTDuBAKSHfyLKwc6dsmZdX
 lcoOSpXoFQgawTGjpGJAVYFiwXn5pJ96tkIhdV8dLCvc/UOlns+C/PFQF5Hx3BaTBDZAKvjJLtA
 kROXVrBEkeUXFO1VsJE1CSMuccrWOd9ecFnqZIOZZ/FvQyG2ipLEQ9UZ3BpuGT+aoaAxmm8JO4O
 dRBMko795i7DqreYSAyhD/Cdyx7r0bVq3DHf6nZetZXGn
X-Google-Smtp-Source: AGHT+IGunpH+JZKwKFBVkZKJBVAeBYmvZF+WRzYwuGwc2eef4/kUIyi3g7q9Pb4ZNRhZgSwHs1Op6w==
X-Received: by 2002:a05:6a00:9a5:b0:74c:efae:fd8f with SMTP id
 d2e1a72fcca58-7702fab4322mr16338654b3a.15.1756142748346; 
 Mon, 25 Aug 2025 10:25:48 -0700 (PDT)
Received: from [192.168.0.102] ([187.75.38.174])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77040215981sm8141658b3a.87.2025.08.25.10.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 10:25:47 -0700 (PDT)
Message-ID: <afd31a15-d4ed-477d-9f72-9c9a23b64047@linaro.org>
Date: Mon, 25 Aug 2025 14:26:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tests/guest-debug: Make QEMU optional in run-test.py
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, qemu-arm@nongnu.org,
 1844144@gmail.com
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <20250819143916.4138035-2-gustavo.romero@linaro.org>
 <875xeb2v4w.fsf@draig.linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <875xeb2v4w.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Alex!

On 8/25/25 14:01, Alex Bennée wrote:
> Gustavo Romero <gustavo.romero@linaro.org> writes:
> 
>> This commit makes QEMU optional in run-test.py, allowing it to be used
>> as a GDB runner, i.e., to call GDB and pass a test script to it without
>> launching QEMU. In this configuration, it is the test script’s duty to
>> configure and run the VMs that GDB connects to.
>>
>> The --binary option continues to be required when --qemu is passed.
>> sys.argv now includes the full path to the test script in addition to
>> the script’s arguments, which allows unittest introspection to work
>> properly in case it is used in the test script.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/guest-debug/run-test.py | 81 +++++++++++++++++++----------------
>>   1 file changed, 45 insertions(+), 36 deletions(-)
>>
>> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
>> index 75e9c92e03..7fa17aedca 100755
>> --- a/tests/guest-debug/run-test.py
>> +++ b/tests/guest-debug/run-test.py
>> @@ -22,10 +22,10 @@
>>   def get_args():
>>       parser = argparse.ArgumentParser(description="A gdbstub test runner")
>>       parser.add_argument("--qemu", help="Qemu binary for test",
>> -                        required=True)
>> +                        required=False)
>>       parser.add_argument("--qargs", help="Qemu arguments for test")
>>       parser.add_argument("--binary", help="Binary to debug",
>> -                        required=True)
>> +                        required=False)
> 
>      parser.add_argument("--binary", help="Binary to debug",
>                          required='--qemu' in sys.argv)
> 
>>       parser.add_argument("--test", help="GDB test script")
>>       parser.add_argument('test_args', nargs='*',
>>                           help="Additional args for GDB test script. "
>> @@ -53,7 +53,7 @@ def log(output, msg):
>>   if __name__ == '__main__':
>>       args = get_args()
>>   
>> -    # Search for a gdb we can use
>> +    # Search for a gdb we can use.
>>       if not args.gdb:
>>           args.gdb = shutil.which("gdb-multiarch")
>>       if not args.gdb:
>> @@ -73,41 +73,49 @@ def log(output, msg):
>>       socket_dir = TemporaryDirectory("qemu-gdbstub")
>>       socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
>>   
>> -    # Launch QEMU with binary
>> -    if "system" in args.qemu:
>> -        if args.no_suspend:
>> -            suspend = ''
>> -        else:
>> -            suspend = ' -S'
>> -        cmd = f'{args.qemu} {args.qargs} {args.binary}' \
>> -            f'{suspend} -gdb unix:path={socket_name},server=on'
>> -    else:
>> -        if args.no_suspend:
>> -            suspend = ',suspend=n'
>> -        else:
>> -            suspend = ''
>> -        cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
>> -            f' {args.binary}'
>> -
>> -    log(output, "QEMU CMD: %s" % (cmd))
>> -    inferior = subprocess.Popen(shlex.split(cmd))
>> +    if args.qemu and not args.binary:
>> +        print("QEMU needs a binary to run, but no binary provided")
>> +        exit(-1)
> 
> then we can avoid this.

Sure, thanks for the suggestion. I'm fixing it in v2.


>>   
>> -    # Now launch gdb with our test and collect the result
>> -    gdb_cmd = "%s %s" % (args.gdb, args.binary)
>> +    if args.qemu:
>> +        # Launch QEMU with binary.
>> +        if "system" in args.qemu:
>> +            if args.no_suspend:
>> +                suspend = ''
>> +            else:
>> +                suspend = ' -S'
>> +            cmd = f'{args.qemu} {args.qargs} {args.binary}' \
>> +                f'{suspend} -gdb unix:path={socket_name},server=on'
>> +        else:
>> +            if args.no_suspend:
>> +                suspend = ',suspend=n'
>> +            else:
>> +                suspend = ''
>> +            cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
>> +                f' {args.binary}'
>> +
>> +        log(output, "QEMU CMD: %s" % (cmd))
>> +        inferior = subprocess.Popen(shlex.split(cmd))
>> +
>> +    # Now launch gdb with our test and collect the result.
>> +    gdb_cmd = args.gdb
>> +    if args.binary:
>> +        gdb_cmd += " %s" % (args.binary)
>>       if args.gdb_args:
>>           gdb_cmd += " %s" % (args.gdb_args)
>> -    # run quietly and ignore .gdbinit
>> +    # Run quietly and ignore .gdbinit.
>>       gdb_cmd += " -q -n -batch"
>> -    # disable pagination
>> +    # Disable pagination.
>>       gdb_cmd += " -ex 'set pagination off'"
>> -    # disable prompts in case of crash
>> +    # Disable prompts in case of crash.
>>       gdb_cmd += " -ex 'set confirm off'"
> 
> The re-formatting makes the diffs very noisy. If you want to clean up
> the captilization of stuff do that in another commit.

OK.


>> -    # connect to remote
>> -    gdb_cmd += " -ex 'target remote %s'" % (socket_name)
>> -    # finally the test script itself
>> +    # Connect automatically to remote only if QEMU is launched.
>> +    if args.qemu:
>> +        gdb_cmd += " -ex 'target remote %s'" % (socket_name)
>> +    # Finally the test script itself.
>>       if args.test:
>> -        if args.test_args:
>> -            gdb_cmd += f" -ex \"py sys.argv={args.test_args}\""
>> +        argv = [args.test] + args.test_args
>> +        gdb_cmd += f" -ex \"py sys.argv={argv}\""
>>           gdb_cmd += " -x %s" % (args.test)
> 
> I can see this echoes from:
> 
>     env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/meson test --suite thorough func-aarch64-aarch64_reverse_debug --verbose
> 
> Shows:
> 
>    GDB CMD: /usr/bin/gdb-multiarch -q -n -batch -ex 'set pagination off' -ex 'set confirm off' -ex "py sys.argv=['/home/alex/lsrc/qemu.git/tests/functional/test_aarch64_reverse_debug.py']" -x /home/alex/lsrc/qemu.git/tests/functional/test_aarch64_reverse_debug.py
> 
> But trying to piece that together on my the command line:
> 
>    env PYTHONPATH=/home/alex/lsrc/qemu.git/python:/home/alex/lsrc/qemu.git/tests/functional /usr/bin/gdb-multiarch -q -n -batch -ex 'set pagination off' -ex 'set confirm off' -ex "py sys.argv=['/home/alex/lsrc/qemu.git/tests/functional/test_aarch64_reverse_debug.py']" -x /home/alex/lsrc/qemu.git/tests/functional/test_aarch64_reverse_debug.py
> Python Exception <class 'ModuleNotFoundError'>: No module named 'pycotap'
> Error occurred in Python: No module named 'pycotap'
> 
> What am I missing?

meson.build in tests/functional is properly setting PYTHONPATH in the env
when meson runs this command. libpython called from gdb binary will inspect
PYTHONPATH later. It's meson that knows where site-packages from the pyvenv
is located, so that's why meson is setting PYTHONPATH and that's why it works
when run by meson.

We should never need to put pieces together to run QEMU tests, I really
hate it (see my previous reply to Thomas about why using Avocado GDB for
test like this is not a good idea IMO).

That said, try to add the site-packages from your pyvenv set in your
build dir to PYTHONPATH:

gromero@gromero0:/mnt/git/qemu_/build$ ls -l ./pyvenv/lib/python3.10/site-packages
total 16
drwxrwxr-x  3 gromero gromero 4096 Aug 25 12:47 meson-1.8.1.dist-info
drwxrwxr-x 17 gromero gromero 4096 Aug 25 12:47 mesonbuild
drwxrwxr-x  3 gromero gromero 4096 Aug 25 12:47 pycotap
drwxrwxr-x  2 gromero gromero 4096 Aug 25 12:47 pycotap-1.3.1.dist-info

This is where the pycotap and other potential modules reside.


Cheers,
Gustavo

>>   
>>   
>> @@ -129,10 +137,11 @@ def log(output, msg):
>>           log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result - 128))
>>           exit(0)
>>   
>> -    try:
>> -        inferior.wait(2)
>> -    except subprocess.TimeoutExpired:
>> -        log(output, "GDB never connected? Killed guest")
>> -        inferior.kill()
>> +    if args.qemu:
>> +        try:
>> +            inferior.wait(2)
>> +        except subprocess.TimeoutExpired:
>> +            log(output, "GDB never connected? Killed guest")
>> +            inferior.kill()
>>   
>>       exit(result)
> 


