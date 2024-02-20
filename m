Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1385075ejb;
        Tue, 20 Feb 2024 08:02:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFr7lmBPumSylqk04HswIr2A54xk4NMfMqVuZByXiFK3th1BSd78UToFWsGQHm8l6AJq4TgOJMOQYh7f+OAL77zlqlckNg
X-Received: by 2002:aa7:81d1:0:b0:6e1:4a02:6217 with SMTP id c17-20020aa781d1000000b006e14a026217mr12112944pfn.22.1708444919592;
        Tue, 20 Feb 2024 08:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708444919; cv=none;
        d=google.com; s=arc-20160816;
        b=PQkCA1qHoKNcbjlbPAy08Te7anQttYaVS8AJ97AMKvc6NcFIwshWWxuvd4VzLquLzz
         /qWghDlBEcS/yBDXDy2iF9jVgavpTRAcobtRK7GH9O4TRDUMt8z/+oaTrl8igIYqFyIw
         0cYra1ofj5plqztg9x3pns7a1sYRl9TtGgyZyCYJZu4EtSfeq2y7T46VY9mlts07A/4z
         CIhksgVOpJeo9mP+CJMQRW4pzCkevfM8dJOjDVTaSChgQbx1FV/4/jRqt67t52CBoACt
         r4opbM0HZAfg4x+qcjm0zxNL/RDxwysRRmmg0KE1OUnOfjGGj0IhEIVlHY4zUfXaXkZ8
         mBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=jl01hblCshM4jrd6Y8lI0n3bYzDGjAPg+QWRlS/Loz8=;
        fh=kpPYm3zldye7YLlt/NZFQOE04ERmWWo2ldAk7Sf23ek=;
        b=fx651xRaSlsCoK5DJtxv0IagFq3M+SorrhJpWU85a3VTL+GEPCpgmkDmJcj71x5m+n
         76fmF7acvnUEwWz2FdmnR8DZu/DqTv0k8tiNkV/L54WEy6prDlWLJlQWcLjqOWPr2hJn
         XSHdMx9SH0P+AJmkfKgtPngj2ival5smcHk3Db8JLGO9ZltkkDhHWTK3rUTgbft8EpCG
         SI3+3SMCga8Zi1K48CHlEJvCsqquCGwTDzA7vQY2/kswGhG6Q1WlMgolhV8pEkzn3I6z
         TQskxva3gBALLaMTNlOSUi1o2ak4k5jHGKcTWSEOqFqFqfy/AoX2nXFVCXsSf4LGccB8
         LArA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AXyAHm/+";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s10-20020a63770a000000b005cf1cec33ecsor4312643pgc.4.2024.02.20.08.01.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Feb 2024 08:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AXyAHm/+";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708444918; x=1709049718; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl01hblCshM4jrd6Y8lI0n3bYzDGjAPg+QWRlS/Loz8=;
        b=AXyAHm/+977jceJR7Libx17oz/+IIqgvz64fJU8yAjMGh98izxG5Bmklyn7whVjlKD
         qHXQcA37GFzysqmxXz9G9Y4EfeOdf+xwYXck1Xqwz35MYknTSGxCtXH6SnfE0h5z/JKV
         5uB1dYaWS7iP+abT5H14NSOjamqLSTz63nlFaBhkRaFghHWvN61TvpPZhyXNnODUeqBj
         UPxRH2m8efSSvsIxXUKfsdNZCmTUG4ReFVc8DU/dv8sIAFiqbSW8pj9FvCJVwCgk39Wi
         AaGFZwSIY0i7B4jyLE7FdjAR/J9drVdQ0OE1MM9621vanyYxj5Iiiea+YRGQ0a9e4L/W
         OSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708444918; x=1709049718;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl01hblCshM4jrd6Y8lI0n3bYzDGjAPg+QWRlS/Loz8=;
        b=A/uJXhaQaJfEXa+ZiYst8MVAUWiiRhm6DFCKVztAoz9zdHT5daQE5kSMKTRlxQn3TT
         GdK4P1fMgkZV8iUsVVF+VEqfUGTcKygQ18Bh0SqnVp4wFakOiMgoaqQtChOES0PtXK3v
         ISMim47z6kVPftxg9YClClVCz/Q/TrhKdqzblrK1mfMgI0e0F2y1g+H5m5XjGD8lTZm2
         ZEdYeBrrbKX3q7qk4vdjfixj/RHqJqYsaKd+3S4vy9ceLlixDJMctwP0PYkMkpRc3yc3
         zdnaiy7ctp9Rj4qClnViOMg7T/Fsgrq9yqSFEAKA1aSFUPCz6lIyq6HkmPHWzrFR8E6q
         zs5w==
X-Forwarded-Encrypted: i=1; AJvYcCXg3tcIRqyr3MVgETqu06ElnGJvvaGjtA5Mw5auhB/gOvlvKo+Q09oZIaPGiavaqsIxCyP0PdUmW8WYF49wuj3OnCLr1Qzb
X-Gm-Message-State: AOJu0YyOqpcHVnRbTPVBP+J5VH3D7VAcl2Gf1ilPjxMJ0Vx3akG9EZb7
	WHynjyAW2A8mqD9ONgs3/bwT5ea5l7YW6VTHLcysIJgTWkRevVCkULufs+bK35V9JA==
X-Google-Smtp-Source: AGHT+IG4fjhBf2ntC1KxE79na/iOR5xeTmFKN7bIW4oVDm0mb2lwqFi0sFt4HAOgofrwSV0QOWSMgA==
X-Received: by 2002:a17:90a:a78d:b0:299:b92b:d1e8 with SMTP id f13-20020a17090aa78d00b00299b92bd1e8mr4102350pjq.7.1708444917929;
        Tue, 20 Feb 2024 08:01:57 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPv6:2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71? ([2804:7f0:b400:1b59:1a6a:7944:fbd6:3f71])
        by smtp.gmail.com with ESMTPSA id sx12-20020a17090b2ccc00b0029454cca5c3sm2410138pjb.39.2024.02.20.08.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 08:01:55 -0800 (PST)
Subject: Re: [PATCH v2 6/6] tests/qtest: Add ivshmem-flat test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Kochkov
 <anton.kochkov@proton.me>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
 <20240216144456.34992-7-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <bfe6403a-46a6-dfb9-6486-f3ea005b15cb@linaro.org>
Date: Tue, 20 Feb 2024 13:01:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240216144456.34992-7-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WwnI+PpK19SN



On 2/16/24 11:44 AM, Philippe Mathieu-Daudé wrote:
> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Add qtest for the ivshmem-flat device.

This needs a commit message.

All tests are failing is this commit due to the last
changes. So we need to tweak it (see my comments inline).

Also, I think we need to mark
it pendent upon the new IRQ toggling API (not merged yet), so add a:

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg03176.html

or

Based-on: <20231113230149.321304-1-gustavo.romero@linaro.org>


> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-ID: <20231127052024.435743-4-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/ivshmem-flat-test.c | 320 ++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build         |   2 +
>   2 files changed, 322 insertions(+)
>   create mode 100644 tests/qtest/ivshmem-flat-test.c
> 
> diff --git a/tests/qtest/ivshmem-flat-test.c b/tests/qtest/ivshmem-flat-test.c
> new file mode 100644
> index 0000000000..5489a0d915
> --- /dev/null
> +++ b/tests/qtest/ivshmem-flat-test.c
> @@ -0,0 +1,320 @@
> +/*
> + * Inter-VM Shared Memory Flat Device qtests
> + *
> + * SPDX-FileCopyrightText: 2023 Linaro Ltd.
> + * SPDX-FileContributor: Gustavo Romero <gustavo.romero@linaro.org>
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + */
> +
> +#include "ivshmem-utils.h"
> +
> +#define IVSHMEM_FLAT_MMR_ADDR 0x400FF000
> +#define IVSHMEM_FLAT_SHM_ADDR 0x40100000
> +#define SHM_SIZE 131072 /* 128k */
> +
> +static ServerThread thread;
> +
> +uint32_t *shm_ptr;
> +char *shm_rel_path;
> +char *server_socket_path;
> +
> +static void cleanup(void)
> +{
> +    if (shm_ptr) {
> +        munmap(shm_ptr, SHM_SIZE);
> +        shm_ptr = NULL;
> +    }
> +
> +    if (shm_rel_path) {
> +        shm_unlink(shm_rel_path);
> +        shm_rel_path = NULL;
> +    }
> +
> +    if (server_socket_path) {
> +        unlink(server_socket_path);
> +        server_socket_path = NULL;
> +    }
> +}
> +
> +static void abort_handler(void *data)
> +{
> +    test_ivshmem_server_stop(&thread);
> +    cleanup();
> +}
> +
> +/*
> + * Check if exactly 1 positive pulse (low->high->low) on 'irq' IRQ line happens
> + * in 'timeout' second(s). 'irq' must be intercepted using qtest_irq_intercept_*
> + * before this function can be used on it. It returns 0 when pulse is detected,
> + * otherwise 1.
> + */
> +static int test_ivshmem_flat_irq_positive_pulse(QTestState *qts, int irq,
> +                                                int timeout)
> +{
> +    uint64_t num_raises = 0;
> +    uint64_t num_lows = 0;
> +    uint64_t end_time;
> +
> +    end_time = g_get_monotonic_time() + timeout * G_TIME_SPAN_SECOND;
> +    do {
> +        num_raises = qtest_get_irq_raised_counter(qts, 0);
> +        if (num_raises) {
> +            num_lows = qtest_get_irq_lowered_counter(qts, 0);
> +            /* Check for 1 raise and 1 low IRQ event. */
> +            if (num_raises == num_lows && num_lows == 1) {
> +                return 0;
> +            } else {
> +                g_message("%s: Timeout expired", __func__);
> +                return 1;
> +            }
> +        }
> +        qtest_clock_step(qts, 10000);
> +    } while (g_get_monotonic_time() < end_time);
> +
> +    return 1;
> +}
> +
> +static inline uint32_t read_reg(QTestState *qts, enum Reg reg)
> +{
> +    uint32_t v;
> +
> +    qtest_memread(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
> +
> +    return v;
> +}
> +
> +static inline void write_reg(QTestState *qts, enum Reg reg, uint32_t v)
> +{
> +    qtest_memwrite(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
> +}
> +
> +/*
> + * Setup a test VM with ivshmem-flat device attached, IRQ properly set, and
> + * connected to the ivshmem-server.
> + */
> +static QTestState *setup_vm(void)
> +{
> +    QTestState *qts;
> +    const char *cmd_line;
> +
> +    cmd_line = g_strdup_printf("-machine lm3s6965evb "
> +                               "-chardev socket,path=%s,id=ivshm "
> +                               "-device ivshmem-flat,chardev=ivshm,"
> +                               "x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',"
> +                               "x-bus-qompath='/sysbus',shmem-size=%d",
> +                               server_socket_path, SHM_SIZE);
> +    qts = qtest_init(cmd_line);
> +
> +    return qts;
> +}
> 

Fix this part with:

      cmd_line = g_strdup_printf("-machine lm3s6965evb "
                                 "-chardev socket,path=%s,id=ivshm "
                                 "-device ivshmem-flat,chardev=ivshm,"
-                               "x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',"
-                               "x-bus-qompath='/sysbus',shmem-size=%d",
+                               "x-irq-qompath='/machine/soc/v7m/nvic/unnamed-gpio-in[0]',"
+                               "x-bus-address-iomem=0x400FF000,"
+                               "x-bus-address-shmem=0x40100000,"
+                               "shmem-size=%d",
                                 server_socket_path, SHM_SIZE);
      qts = qtest_init(cmd_line);

The x-bus-address-iomem and x-bus-address-shmem options are necessary
in the current state and if my suggestion for making them non-optional
is taken.


> +static void test_ivshmem_flat_irq(void)
> +{
> +    QTestState *vm_state;
> +    uint16_t own_id;
> +
> +    vm_state = setup_vm();
> +
> +    qtest_irq_intercept_out_named(vm_state,
> +                                  "/machine/peripheral-anon/device[0]",
> +                                  "irq-output");

      qtest_irq_intercept_out_named(vm_state,
                                    "/machine/peripheral-anon/device[0]",
-                                  "irq-output");
+                                  "sysbus-irq");


> +
> +    /* IVPOSTION has the device's own ID distributed by the ivshmem-server. */
> +    own_id = read_reg(vm_state, IVPOSITION);
> +
> +    /* Make device notify itself. */
> +    write_reg(vm_state, DOORBELL, (own_id << 16) | 0 /* vector 0 */);
> +
> +    /*
> +     * Check intercepted device's IRQ output line. Named IRQ line 'irq-output'
> +     * was associated to qtest IRQ 0 and after self notification qtest IRQ 0
> +     * must be toggled by the device. The test fails if no toggling is detected
> +     * in 2 seconds.
> +     */
> +    g_assert(test_ivshmem_flat_irq_positive_pulse(vm_state, 0, 2) == 0);
> +
> +    qtest_quit(vm_state);
> +}
> +
> +static void test_ivshmem_flat_shm_write(void)
> +{
> +    QTestState *vm_state;
> +    int num_elements, i;
> +    uint32_t  *data;
> +
> +    vm_state = setup_vm();
> +
> +    /* Prepare test data with random values. */
> +    data = g_malloc(SHM_SIZE);
> +    num_elements = SHM_SIZE / sizeof(*data);
> +    for (i = 0; i < num_elements; i++) {
> +        data[i] = g_test_rand_int();
> +    }
> +
> +    /*
> +     * Write test data to VM address IVSHMEM_FLAT_SHM_ADDR, where the shared
> +     * memory region is located.
> +     */
> +    qtest_memwrite(vm_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
> +
> +    /*
> +     * Since the shared memory fd is mmapped into this test process VMA at
> +     * shm_ptr, every byte written by the VM in its shared memory region should
> +     * also be available in the test process via shm_ptr. Thus, data in shm_ptr
> +     * is compared back against the original test data.
> +     */
> +    for (i = 0; i < num_elements; i++) {
> +        g_assert_cmpint(shm_ptr[i], ==, data[i]);
> +    }
> +
> +    qtest_quit(vm_state);
> +}
> +
> +static void test_ivshmem_flat_shm_read(void)
> +{
> +    QTestState *vm_state;
> +    int num_elements, i;
> +    uint32_t  *data;
> +    uint32_t v;
> +
> +    vm_state = setup_vm();
> +
> +    /* Prepare test data with random values. */
> +    data = g_malloc(SHM_SIZE);
> +    num_elements = SHM_SIZE / sizeof(*data);
> +    for (i = 0; i < num_elements; i++) {
> +        data[i] = g_test_rand_int();
> +    }
> +
> +    /*
> +     * Copy test data to the shared memory region so it can be read from the VM
> +     * (IVSHMEM_FLAT_SHM_ADDR location).
> +     */
> +    memcpy(shm_ptr, data, SHM_SIZE);
> +
> +    /* Check data */
> +    for (i = 0; i < num_elements; i++) {
> +        qtest_memread(vm_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
> +                      sizeof(v));
> +        g_assert_cmpint(v, ==, data[i]);
> +    }
> +
> +    qtest_quit(vm_state);
> +}
> +
> +static void test_ivshmem_flat_shm_pair(void)
> +{
> +    QTestState *vm0_state, *vm1_state;
> +    uint16_t vm0_peer_id, vm1_peer_id;
> +    int num_elements, i;
> +    uint32_t  *data;
> +    uint32_t v;
> +
> +    vm0_state = setup_vm();
> +    vm1_state = setup_vm();
> +
> +    /* Get peer ID for the VM so it can be used for one notify each other. */
> +    vm0_peer_id = read_reg(vm0_state, IVPOSITION);
> +    vm1_peer_id = read_reg(vm1_state, IVPOSITION);
> +
> +    /* Observe vm1 IRQ output line first. */
> +    qtest_irq_intercept_out_named(vm1_state,
> +                                  "/machine/peripheral-anon/device[0]",
> +                                  "irq-output");

      /* Observe vm1 IRQ output line first. */
      qtest_irq_intercept_out_named(vm1_state,
                                    "/machine/peripheral-anon/device[0]",
-                                  "irq-output");
+                                  "sysbus-irq");


> +
> +    /* Notify (interrupt) VM1 from VM0. */
> +    write_reg(vm0_state, DOORBELL, (vm1_peer_id << 16) | 0 /* vector 0 */);
> +
> +    /* Check if VM1 IRQ output line is toggled after notification from VM0. */
> +    g_assert(test_ivshmem_flat_irq_positive_pulse(vm1_state, 0, 2) == 0);
> +
> +    /* Secondly, observe VM0 IRQ output line first. */
> +    qtest_irq_intercept_out_named(vm0_state,
> +                                  "/machine/peripheral-anon/device[0]",
> +                                  "irq-output");

      /* Secondly, observe VM0 IRQ output line first. */
      qtest_irq_intercept_out_named(vm0_state,
                                    "/machine/peripheral-anon/device[0]",
-                                  "irq-output");
+                                  "sysbus-irq");


> +
> +    /* ... and do the opposite: notify (interrupt) VM0 from VM1. */
> +    write_reg(vm1_state, DOORBELL, (vm0_peer_id << 16) | 0 /* vector 0 */);
> +
> +    /* Check if VM0 IRQ output line is toggled after notification from VM0. */
> +    g_assert(test_ivshmem_flat_irq_positive_pulse(vm0_state, 0, 2) == 0);
> +
> +    /* Prepare test data with random values. */
> +    data = g_malloc(SHM_SIZE);
> +    num_elements = SHM_SIZE / sizeof(*data);
> +    for (i = 0; i < num_elements; i++) {
> +        data[i] = g_test_rand_int();
> +    }
> +
> +    /* Write test data on VM0. */
> +    qtest_memwrite(vm0_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
> +
> +    /* Check test data on VM1. */
> +    for (i = 0; i < num_elements; i++) {
> +        qtest_memread(vm1_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
> +                      sizeof(v));
> +        g_assert_cmpint(v, ==, data[i]);
> +    }
> +
> +    /* Prepare new test data with random values. */
> +    for (i = 0; i < num_elements; i++) {
> +        data[i] = g_test_rand_int();
> +    }
> +
> +    /* Write test data on VM1. */
> +    qtest_memwrite(vm1_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
> +
> +    /* Check test data on VM0. */
> +    for (i = 0; i < num_elements; i++) {
> +        qtest_memread(vm0_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
> +                      sizeof(v));
> +        g_assert_cmpint(v, ==, data[i]);
> +    }
> +
> +    qtest_quit(vm0_state);
> +    qtest_quit(vm1_state);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    int shm_fd, r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    /* If test fails, stop server, cleanup socket and shm files. */
> +    qtest_add_abrt_handler(abort_handler, NULL);
> +
> +    shm_rel_path = mktempshm(SHM_SIZE, &shm_fd);
> +    g_assert(shm_rel_path);
> +
> +    /*
> +     * Map shm to this test's VMA so it's possible to read/write from/to it. For
> +     * VMs with the ivhsmem-flat device attached, this region will also be
> +     * mapped in their own memory layout, at IVSHMEM_FLAT_SHM_ADDR (default).
> +     */
> +    shm_ptr = mmap(0, SHM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
> +    g_assert(shm_ptr != MAP_FAILED);
> +
> +    server_socket_path = mktempsocket();
> +    /* It never fails, so no assert(). */
> +
> +    /*
> +     * Currently, ivshmem-flat device only supports notification via 1 vector,
> +     * i.e. vector 0.
> +     */
> +    test_ivshmem_server_start(&thread, server_socket_path, shm_rel_path, 1);
> +
> +    /* Register tests. */
> +    qtest_add_func("/ivshmem-flat/irq", test_ivshmem_flat_irq);
> +    qtest_add_func("/ivshmem-flat/shm-write", test_ivshmem_flat_shm_write);
> +    qtest_add_func("/ivshmem-flat/shm-read", test_ivshmem_flat_shm_read);
> +    qtest_add_func("/ivshmem-flat/pair", test_ivshmem_flat_shm_pair);
> +
> +    r = g_test_run();
> +
> +    test_ivshmem_server_stop(&thread);
> +    cleanup();
> +
> +    return r;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index bc6457220c..c0468bc6e0 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -205,6 +205,7 @@ qtests_stm32l4x5 = \
>      'stm32l4x5_syscfg-test']
>   
>   qtests_arm = \
> +  (config_all_devices.has_key('CONFIG_IVSHMEM_FLAT_DEVICE') ? ['ivshmem-flat-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
> @@ -320,6 +321,7 @@ qtests = {
>     'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
>     'erst-test': files('erst-test.c'),
>     'ivshmem-test': ['ivshmem-utils.c', '../../contrib/ivshmem-server/ivshmem-server.c'],
> +  'ivshmem-flat-test': ['ivshmem-utils.c', '../../contrib/ivshmem-server/ivshmem-server.c'],
>     'migration-test': migration_files,
>     'pxe-test': files('boot-sector.c'),
>     'qos-test': [chardev, io, qos_test_ss.apply({}).sources()],
> 
